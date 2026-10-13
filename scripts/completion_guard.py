#!/usr/bin/env python3
"""Refuses a completion the series plan does not support.

A writer that reaches the end of the current volume has no way to tell "the book
is finished" from "this volume is finished". It has happened, and it ended a
500-chapter novel at chapter 50 because the volume outline stopped there.

The controller, not the model, decides this. Parse the planned end of the book
out of outline/series.md and compare it with what is actually on disk. Exit 0
only when the manuscript genuinely reaches the planned end.
"""
from __future__ import annotations

import os
import re
import sys

# "Volume 10. **Returned** (ch 443-500)", "Target length 500 chapters",
# "chapters 41-50", "500 chapters across 10 volumes".
RANGES = re.compile(r"\bch(?:apters?)?\s*(\d+)\s*(?:-|–|—|to)\s*(\d+)", re.I)
TARGET = re.compile(r"target length\s*[:\-]?\s*(\d+)", re.I)
BARE = re.compile(r"\b(\d{3,4})\s+chapters\b", re.I)


def planned_final(root: str) -> tuple[int | None, str]:
    """Return (chapter number, the text it was read from).

    NOVEL_SPEC.md is checked alongside the outlines and is the more reliable of
    the two: a series outline is free prose written by the model, and one of them
    named ten volumes without ever stating a chapter count. When the outlines say
    nothing, the spec's target length is the authority.
    """
    best = 0
    source = ""
    for name in ("outline/series.md", "outline/ending.md", "NOVEL_SPEC.md"):
        path = os.path.join(root, name)
        if not os.path.isfile(path):
            continue
        try:
            text = open(path, encoding="utf-8").read()
        except OSError:
            continue
        for match in RANGES.finditer(text):
            for group in (1, 2):
                value = int(match.group(group))
                if value > best:
                    best = value
                    source = match.group(0)
        for pattern in (TARGET, BARE):
            for match in pattern.finditer(text):
                value = int(match.group(1))
                if value > best:
                    best = value
                    source = f"{name}: {match.group(0).strip()}"
    if best:
        return best, source
    return None, ""


def written_chapters(root: str) -> int:
    """Count chapters across both layouts the fleet has used."""
    found: set[int] = set()
    pattern = re.compile(r"chapter-(\d+)\.md$")
    for base in ("chapters", "workspace"):
        start = os.path.join(root, base)
        for dirpath, _dirs, files in os.walk(start):
            for name in files:
                match = pattern.search(name)
                if match:
                    found.add(int(match.group(1)))
    return len(found)


def main() -> int:
    root = os.path.abspath(sys.argv[1] if len(sys.argv) > 1 else ".")
    target, source = planned_final(root)
    written = written_chapters(root)

    if target is None:
        print(f"completion-guard: no planned end found in outline/series.md; "
              f"allowing ({written} chapters written)")
        return 0

    if written >= target:
        print(f"completion-guard: ok, {written} chapters reaches planned {target}")
        return 0

    print(f"completion-guard: REFUSING completion. "
          f"{written} chapters written, plan expects {target} ({source}).")
    print("completion-guard: the current volume ending is not the end of the book. "
          "Plan the next volume instead.")
    return 1


if __name__ == "__main__":
    sys.exit(main())