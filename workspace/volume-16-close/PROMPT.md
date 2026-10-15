# VOLUME 16 CLOSE RECORD — phase `volume-16-close`, the last phase of this run

**This is the CLOSE RECORD, not the close audit. The close audit has been done. Do not do it again.**

## What has already happened

`NOVEL_SPEC.md` fixes this book at **one thousand chapters across sixteen volumes** and `outline/ending.md` fixes the
last chapter. **The manuscript is complete: `chapters/volume-16/` holds ch 901–1000, the run stands at 1,000 chapter
files and 1,881,197 words of body prose on method B, and `scripts/completion_guard.py` exits 0 —
`completion-guard: ok, 1000 chapters reaches planned 1000`.**

**There is no Volume 17.** The phase prompt that dispatched this one says to plan the next volume if the current
volume is complete. It is complete, and it is the last volume in the plan, so the correct job is not a volume plan.
It is the second half of `PHASE_SYSTEM.md` §The volume close: **write the resolution into the state files and stand the
book down.**

**The audit half is done and its record is where you need it. Read these four before you touch anything:**

- `state/continuity.md` under ***VOLUME 16 CLOSE — The Last Announcement, ch 901–1000, the volume as a whole***
- `state/current.md`, the block at the foot: ***Who is where at end of chapter 1000 — VOLUME 16 CLOSED AND AUDITED, AND
  THE MANUSCRIPT IS COMPLETE***
- `state/open-threads.md` under ***The Volume 16 close, 15 Oct 2026, phase `next-0015` — what is now closed and what is
  open on purpose***, which carries **the canon ruling on the hands**
- `state/chapter-summaries.md` under ***Volume 16 closed — the whole volume, ch 901–1000, and the manuscript***

## What this phase does, in order

**1 — Re-measure every published figure before you quote it.** The run's rule is that a figure is not true because a
state file says so. Re-derive, by script over the chapter files and naming the method in the same sentence as the
number, at minimum: the Volume 16 file count and body-prose total and average; the seven per-batch totals; the
per-chapter shortest and longest; the manuscript total across all 1,000 files; the eight bracket lines and the fact
that ch 971 is the last one in the manuscript; `nobody`, `eleven`, `court`, `ledger`, `choir`, `ascendant`,
`forgiv`, `thank`, `the year`, `twenty-two days`, `scribe`; the count of paragraphs over ninety and over 120 words;
and `python3 scripts/completion_guard.py`. **If a figure does not reproduce, correct it in place and say so in the
repair note. Do not delete the record.**

**2 — Write the series close record into the state files.** One block, and it is the last block in the run:
the book is finished; here is what the sixteen volumes promised against what they paid; here is the final table of
every volume's chapter range, day range, word count and irreversible steps, read off the chapter files rather than
off the outlines; here is what the series deliberately never answered, gathered into one place so that no future
reader mistakes an open thread for a dropped one; and here is the state of the world at ch 1000 in the terms a
cold reader needs. **`state/current.md` and `state/chapter-summaries.md` already carry the Volume 16 half — build the
series half on top of them and do not re-derive what they already say.**

**3 — Check the two things that were never checked, once, cheaply.**

- **The protagonist requirement.** `outline/series.md` §2 names **Yuan, male**, as the protagonist, and `AGENTS.md`
  requires the lead's escalation to be visible. Confirm by measurement that he is not a decorative voice anywhere in
  the hundred chapters of the final volume — and say plainly what the final volume did to him.
- **The opening contract.** Spot-check ch 1–3 against `AGENTS.md`: a concrete objective, an anomaly and a consequence
  inside the first eight hundred words of ch 1, and the central mechanic **and its cost** demonstrated by an event by
  the end of ch 3. Record what holds and what does not. **Do not repair ch 1–3 in this phase.** Volumes 1 to 3 are
  closed and audited and this is the close record, not a re-plan; if something is wrong there, record it as a finding
  for a human and stop.

**4 — Stand the book down. Write no further phase prompt.**

**This phase creates no next phase.** There is nothing after it. `PHASE_SYSTEM.md` §Self-dispatch sends at most one
dispatch for a novel, and the correct thing for the chain to do after this commit is stop.

**Do not** write `state/phase-ledger.json` — it is controller-owned and does not exist. **A `.done` marker is
runner-owned** (`scripts/novel_runner.sh` touches it after a phase commits, and every completed phase directory
already carries one) — you do not create it, and you must not create a `.blocked`, a `.retry-after` or a `.retired`
either. **Do not** create a ch 1001, a Volume 17, an `outline/volume-17.md`, or a second prompt anywhere.

## What you may edit

Fiction, bible, outline, chapter, summary, continuity, character and open-thread files, and the state files.
**Nothing under `scripts/`, `.github/workflows/`, `.opencode/agent/`, and none of `AGENTS.md`, `PHASE_SYSTEM.md`,
`REPO_PLAN.md`, `OUTLINE_GUIDE.md`, `opencode.json`.**

## The standing rules, which are not optional here

- **`state/current.md` is append-only.** Correct a wrong line in place and say so in the repair note; never delete a
  block.
- **Body prose is every line not beginning `#`** (`grep -v '^#' <file> | wc -w`, per file, summed). Name the method in
  the same sentence as the number.
- **`outline/ending.md` is fixed and was not rewritten by any phase and must not be rewritten by this one.**
- **Preserve the planned ending.** Do not add a coda, an epilogue, an author's note in the fiction, or a Volume 17.
- **A phase that exits without writing anything has asked for more than one call can deliver.** If this turns out to
  be too large, write the re-measurement and the final series table, and leave the rest for the next run rather than
  returning empty.
