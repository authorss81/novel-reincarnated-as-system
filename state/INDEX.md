# State index

**Written by the Volume 7 close review fix pass.** `PHASE_SYSTEM.md` §*State Growth* says: *"Keep summaries
compact and bounded… If the continuity files grow too large, create a volume-level index and retrieve only
relevant sections."* `state/` had reached ~2.3 MB across five files and every phase prompt tells the writer to
read `state/current.md` and `state/continuity.md`. **There was no index, so the remedy had never been applied.**

**This is that index, and the first archive pass that goes with it. Nothing was deleted.**

## What the pass did

| File | Before | After (hot) | Archived |
| --- | --- | --- | --- |
| `state/continuity.md` | 913,631 B | 286,993 B | `state/archive/continuity-before-volume-07.md` — 666,949 B of bodies |
| `state/current.md` | 687,607 B | 441,036 B | `state/archive/current-closed-volumes-01-to-06.md` — 283,366 B of bodies |
| `state/chapter-summaries.md` | 503,828 B | 173,259 B | `state/archive/chapter-summaries-volumes-01-to-06.md` — 339,363 B of bodies |

**Hot `state/`, measured after the pass: 1,152,162 B across the five files, was ~2,337,000 B. Archived:
1,292,014 B, all of it verbatim.** Sections moved: **50 of 73** in `continuity.md`, **42 of 69** in `current.md`,
**12 of 20** in `chapter-summaries.md`. **`## ` heading count is unchanged in all three** — 73, 69 and 20, the
69 being the 68 that were there plus the one new section this pass added to `current.md`.

**HOW IT WORKS, AND WHY IT LOSES NOTHING.** Whole `## ` sections were **moved**, not deleted. In the hot file
each one is replaced by a stub that **keeps the original heading line**, so `grep '^## '`, `grep 'Volume 6
close'` and every other search still finds the section where a phase expects to find it, and the stub names
the archive file to read. Every moved byte is in the archive file under its original heading.

**THE RULE A SECTION HAD TO MEET BEFORE IT COULD MOVE.** No kept section of the same file may cross-reference
it — by full heading, by short form, or inside backticks or bold. That was resolved to a fixpoint, so **the
cold-start reading guide in `state/current.md` is still valid as written** and every block it names is still on
the hot file. *Nothing on this pass was moved because it was inconvenient; everything moved because nothing
reads it.*

**ONE HONEST CAVEAT.** Ten blocks moved out of `state/current.md` are named *in passing* inside prose in a kept
section — a sentence like *the block at ch 178 that Volume 4 inherited*. Those are historical allusions in
narrative text, not navigation instructions, **and the stub for each one is still in the hot file under its
original heading**, so the allusion still resolves. **No reading instruction anywhere now points at an archive
file without saying so in the same line.**

**A PHASE THAT WANTS AN ARCHIVED SECTION.** Read the stub, open the archive file it names, read the section by
its heading. **A phase must not re-derive an archived figure from the chapters** — the archive is the record of
what was measured at the time, and re-measuring it will produce a different number.

## Hot file, by section

### `state/current.md` — the position. Read this one first.

| Section | What it is |
| --- | --- |
| `## How to read this file` | The cold-start reading order for the whole run. **Still valid as written, and its live-position entry was corrected to ch 523 at the Volume 9 Batch 0003 review.** |
| `## Who is where at end of chapter 523` | **THE LIVE POSITION.** ch 523, day 1,561. Every earlier position block is superseded by this one. |
| `## Who is where at end of chapter 508` | The Volume 9 Batch 0002 position, superseded by the ch 523 block. |
| `## Where Volume 9 actually stands` | **READ THIS SECOND.** The three batches on the page, their days, their brackets, and the fact that Volume 9 is on its last batch. |
| `## Volume 9 Batch 0003 — REVIEW REPAIR` | **READ AFTER THAT.** Six findings closed and a seventh found while applying them: the transposed operand in the 258-day silence, the ch 522 day row short by three, the two carried-days notes reconciled to 1,557–1,560, four stale headers in this file plus three live pointers elsewhere, two duplicated paragraphs recast at ch 513 and ch 515, and the authorial heading at ch 518. **No beat, day-table anchor, title, stage, bracket or irreversible decision moved.** |
| `## Who is where at end of chapter 434` | The Volume 8 Batch 0001 position, superseded by the ch 508 and ch 523 blocks. |
| `## Who is where at end of chapter 420` | The Volume 7 Batch 0004 position, superseded by the ch 434 block. Kept because the cold-start reading guide names it |
| `## Volume 8 Batch 0001 — what the batch did, and where the order went` | **What ch 421–434 changed, and the three places the card file lost to the day table.** |
| `## Volume 8 Batch 0001 — REVIEW REPAIR` | **READ AFTER THAT.** All twenty-one review findings closed: the copper ledger reconciled on twenty-one, every interval back to the ch 417 refusal put on counted days, ch 421's double-booked seventh hour and rewind repaired and the twenty-ninth shared with ch 422, the trip put back to four days, ten craft defects and four state-file defects closed, and three adjacent defects found and fixed in the same class. No beat, day-table position, title, stage, bracket or irreversible decision moved |
| `## Volume 7 close repair order` | **DISCHARGED.** F1–F7 cleared on the page by the Volume 8 Batch 0001 drafting phase; F8–F13 verified; F14 recorded against `outline/volume-07.md`, which no phase may edit. Record at `state/continuity.md` §*PHASE ZERO* |
| `## Volume 8 planning — the deviation, and where the sixteen findings went` | **READ THIS SECOND.** Why Volume 8 planning opened ahead of the repair order, and which phase now owns F1–F7. One read long. |
| `## Volume 8 planned — outline/volume-08.md exists and what the plan fixed` | **THE VOLUME 8 PLAN, in seventeen numbered items.** The stages and their days, the two costs, the thinned bracket budget, the six mouths, the four batches, the engine, and what the plan explicitly does not do. |
| `## Volume 8 plan — REVIEW REPAIR` | **READ THIS FIRST.** Six defects the review found in the Volume 8 plan before a line of it was drafted, all closed: the ch 428 heading, the three-way contradiction in the stage span, two stale day-table rows, one line of dialogue pinned to the wrong chapter, a day claimed by two chapters, and a grammar slip. **Names the two day references inside the ch 433 card that went with the re-cut, and says why Phase Zero was left for the drafting phase.** |
| `## Volume 7 close audit — CLOSED` | The close: fourteen fixed items walked, sixteen findings, the seventeen continuity facts, the protagonist answered in writing, the Volume 8 hand-off. |
| `## Volume 7 close repair order — the sixteen findings, and the phase that must clear them` | **THE OBLIGATION.** File and line of all sixteen, and what must not be touched while clearing them. **The planning phase named it as blocking itself, was dispatched anyway, and moved F1–F7 into `workspace/volume-08-batch-0001/PROMPT.md` under `## PHASE ZERO`. Read the section above this one first.** |
| `## Volume 7 planned`, `## Volume 7 planning — close review repair`, `## Volume 7 Batch 0003 — REVIEW REPAIR` | The plan and two repairs. |
| `## Who is where at end of chapter 404 / 389 / 374 / 360 / 345 / 329 / 313 / 252 / 238` | Kept only because the reading guide names them. Superseded by the ch-420 block. |
| `## Volume 6 close audit — OPENED / CLOSED`, `## Volume 6 close review — REPAIR` | Volume 6's close. The Volume 7 audit cross-references it. |
| `## Volume 5 close audit — CLOSED`, `## Volume 4 close audit — CLOSED`, `## Volume 3 close audit — CLOSED` | Earlier close audits, kept for their preserved-continuity lists. |
| `## What Volume 3 must not do` (both headings), `## Proposed canon changes`, `## Chapter-length decision`, `## Planning traps this file still carries` | Standing bans and decisions. **Still binding.** |
| Everything else | Stub → `state/archive/current-closed-volumes-01-to-06.md` |

### `state/continuity.md` — the rules and the measured facts. Read the head of it.

| Section | What it is |
| --- | --- |
| `## World rules` | The nine hard world rules, including the weekday rule and the month rule. **Every phase reads this and it never moves.** |
| `## The layer's rules`, `## Registers`, `## Prose`, `## Content`, `## Named and reserved` | The rest of the spine. |
| `## Established facts (through ch 24)` | The original fact base. |
| `## Volume 9 Batch 0003 (ch 509–523) — established facts, carried to Batch 0004` *(and its `— REVIEW REPAIR`)* | **THE LIVE FACTS.** The day table, the three severances and their days, the three published silences with their subtractions, the opened wall, the fifth frame scene, the price of a door, and the construction budget — **plus the review repair, which corrects the 258-day operand, the ch 522 and ch 523 rows and both carried-days notes, and records that the batch is 28,572 words of body prose on method B, average ~1,905.** |
| `## Volume 7 planned` … `## Volume 7 close — the volume as a whole` | **All sixteen Volume 7 sections**: per-batch established facts, the four running ledgers, the four construction budgets, the batch review repairs, the close, and the volume's full measured figures with the method beside each number. |
| Everything else | Stub → `state/archive/continuity-before-volume-07.md`. This is Volumes 1–6: established facts, running ledgers, construction budgets, batch and close review repairs. |

### `state/chapter-summaries.md` — the per-chapter summaries.

| Section | What it is |
| --- | --- |
| `## Rolling volume summary` | **The standing one-paragraph-per-volume summary. Read this instead of the archives.** |
| `## Volumes 5–16` | What is still unwritten. |
| `## Volume 7 planned` … `## Volume 7 closed — audited` | All sixteen Volume 7 sections, chapter by chapter. |
| Everything else | Stub → `state/archive/chapter-summaries-volumes-01-to-06.md`. Per-chapter summaries for Volumes 1–6. |

### `state/open-threads.md` — not archived, and that is deliberate.

**188 KB, entirely live, and it is the file that answers *what is still open*.** It is the shortest of the five
and every block in it is a thread or a standing ban. It was left whole on purpose: archiving it would hide the
open threads, which is the one thing it exists to do. **Volume 8's own block is the last section, at
`## Volume 8 PLANNED — what the plan adds to the thread list, before a line of it is on the page`. Volume 7's are the
five before it, at `## Volume 7 planned`, `## Volume 7 Batch 0001` … `## Volume 7 Batch 0004`, and
`## Volume 7 CLOSED at ch 420 — every thread, measured, and what Volume 8 inherits live`.**

### `state/book-metadata.md` — not archived. 52 KB, twenty-three long lines, all of it current status.

## For the next phase

**Volume 9 Batch 0004 drafting reads, in this order:** `workspace/volume-09-batch-0004/PROMPT.md` — **which is the whole
brief: ch 524–538, days 1,562–1,598, pressure *surviving being kept*, and the batch that closes the volume** — then
`outline/volume-09.md` · this file · `state/current.md` §*Where Volume 9 actually stands* ·
`state/current.md` §*Who is where at end of chapter 523* · `state/current.md` §*Volume 9 Batch 0003 — REVIEW REPAIR* ·
`state/continuity.md` §*World rules* · `state/continuity.md` §*Established facts, Volume 9 Batch 0003 (ch 509–523), carried
to Batch 0004* and its `— REVIEW REPAIR` · `state/open-threads.md` §*Volume 9 Batch 0003 (ch 509–523) — what this batch
added, live going into Batch 0004* · `state/chapter-summaries.md` §*Volume 9 Batch 0003*.

**Corrected at the Volume 9 Batch 0003 review.** This block previously sent every phase to Volume 8 Batch 0001 and its
PHASE ZERO, which were discharged four phases before it, and the hot-file tables above it still named ch 434 as the live
position. **Both are corrected here and in the tables; the Volume 7 close repair order paragraph below is left as
written, because it is a record of a discharged obligation and not a reading instruction.**

## The next time this is needed

`state/` is at ~1.13 MB hot and growing ~40 KB a phase. **At the Volume 8 close, run the same pass**: archive
everything behind the live volume out of `current.md`, `continuity.md` and `chapter-summaries.md` into a new file
under `state/archive/`, leave the stubs, and extend this index. **Do not prune.** `PHASE_SYSTEM.md` gives the
remedy as an index and an archive, not a deletion, and every one of these files is a record of what was measured
at the time it was measured.