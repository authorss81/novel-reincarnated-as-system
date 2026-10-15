# CLOSING DECLARATION — the manuscript is complete. Write nothing.

`NOVEL_SPEC.md`, `outline/series.md` and `outline/ending.md` fix this book at **one thousand chapters across sixteen
volumes**. `chapters/` holds ch 0001–1000 with no gap and no duplicate, and `scripts/completion_guard.py` exits 0.
**The manuscript is complete, the ending `outline/ending.md` fixes is on the page at ch 1000, and there is no
Volume 17.**

## What this phase is for

This phase exists so the runner recognises the declaration. `scripts/novel_runner.sh` reads this prompt, sees that it
instructs the run to record the completion and to write nothing, re-checks the series plan with
`scripts/completion_guard.py`, and writes `state/complete.md` itself. **This phase records the completion of the book
and creates no phase after it. Write nothing.**

## What a phase must never do here

There is no Volume 17 to plan. Do not write `outline/volume-17.md`, do not write a ch 1001, do not write a batch card,
and do not plan an epilogue or a coda. `outline/series.md` fixes the length in its third line and `outline/ending.md`
§7 fixes the last chapter. **Extending past 1,000 would also make `scripts/completion_guard.py` refuse the completion it
currently accepts**, because it reads its planned end out of the outlines and would then find a chapter range above the
last one written.

If this prompt is ever executed by a model instead of being recognised as a declaration, the correct output is **no
change at all**. The series close record is already written: `state/current.md` at
***WHO IS WHERE AT THE END OF THE BOOK***, `state/continuity.md` at ***THE SERIES CLOSE — ch 1–1000***,
`state/chapter-summaries.md` at ***THE SERIES CLOSE — ch 1–1000, sixteen volumes***, and `state/open-threads.md` at
***The series close, 15 Oct 2026 — everything the book chose not to answer***. There is nothing left to audit and no
figure left to re-derive.

## What happens after this, in order

1. The runner recognises the declaration, writes `state/complete.md`, and marks this phase done. **No model runs.**
2. `retire_obsolete_phases` sees `state/complete.md` and retires every remaining pending phase, so no continuation
   can resume the book after its ending.
3. The workflow's seed step sees `state/complete.md` and creates the one post-completion phase,
   `workspace/postface/synopsis/`, which writes `state/synopsis.md` and creates no phase after it.
4. `epub.yml` builds and publishes once both `state/complete.md` and `state/synopsis.md` exist.

**The chain ends there.** Nothing under `scripts/`, `.github/workflows/` or `.opencode/agent/` is edited by this or any
phase, no `state/phase-ledger.json` is written, and no `.done`, `.blocked`, `.retry-after` or `.retired` marker is
created by the writer.