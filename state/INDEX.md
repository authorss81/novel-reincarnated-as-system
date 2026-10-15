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

## THE SECOND ARCHIVE PASS — run 15 Oct 2026 by the Volume 14 Batch 0002 drafting phase, before ch 796

**`state/INDEX.md` ordered this pass and Volume 14 planning recorded it as not run. It has now been run, before a
single line of ch 796 was drafted, by the writer who had Batch 0002 in front of them rather than by a writer closing
another batch. Before and after, measured the same way both times.**

| File | Before — lines / words / bytes | After (hot) — lines / words / bytes | Archived, verbatim |
| --- | --- | --- | --- |
| `state/continuity.md` | 10,669 / 266,492 / 1,424,570 | 792 / 15,281 / 91,268 | `state/archive/continuity-through-volume-13-batch-0004.md` — 133 `## ` sections |
| `state/current.md` | 6,090 / 162,287 / 883,505 | 710 / 18,092 / 109,345 | `state/archive/current-volume-05-through-volume-13-batches.md` — 110 `## ` sections |
| `state/chapter-summaries.md` | 2,594 / 119,363 / 613,717 | 268 / 21,737 / 116,279 | `state/archive/chapter-summaries-volume-07-through-volume-13.md` — 36 `## ` sections |

**Hot `state/` across the three touched files fell from 2,921,842 B to 316,892 B. The reading order in this file is
unchanged and every heading still resolves: each moved section keeps its original `## ` heading in the hot file under
a stub naming the archive file to read. **`## ` heading counts are unchanged in all three — 141 in `continuity.md`,
121 in `current.md`, 51 in `chapter-summaries.md` — which is the pass's own proof that it moved rather than deleted.**

**WHAT WAS LEFT IN PLACE, AND WHY, STATED SO A LATER PHASE CAN CHECK IT.** `state/continuity.md` keeps its spine
(`## World rules`, `## The layer's rules`, `## Registers`, `## Prose`, `## Content`, `## Named and reserved`,
`## Established facts (through ch 24)`) and everything from **`## VOLUME 13 — THE CLOSE`** to the foot of the file.
`state/chapter-summaries.md` keeps **`## Rolling volume summary`** — the standing one-paragraph-per-volume summary
this index tells phases to read instead of the archives — and `## Volumes 5–16` and `## Volume 6`, and keeps
**`## VOLUME 14 BATCH 0001`** and everything after it. `state/current.md` keeps **`## How to read this file`**,
because it is the cold-start reading order and it names blocks by heading, and it keeps the eight standing-ban blocks
— `## Chapter-length decision`, `## What batch 0007 must not do`, `## What Volume 3 must not do`, `## Proposed canon
changes`, `## Volume 2 plan decisions`, `## Construction budget — Volume 1 items, do not reuse`, `## Canon changes made
in batch 0006`, `## Planning traps this file still carries` — **because a ban moved out of the hot file is a ban a
later phase does not read**, and it keeps everything from **`## Who is where at the end of Volume 13`** to the foot of
the file, which is the immediate predecessor and the live volume's own record.

**ONE DISCREPANCY IN THE CARD THIS PASS ANSWERED, RECORDED RATHER THAN SILENTLY RESOLVED.**
`workspace/volume-14-batch-0002/PROMPT.md` says *leave `## Who is where at end of chapter 795` and everything above it
in place* and, two sentences earlier and three times over, *move everything up to and including the Volume 12 close
and the Volume 13 planning and batch records*. In `state/current.md` the ch-795 block is the **last** block in the
file, so the first reading leaves the whole file in place and archives nothing from it. **The enumeration was taken as
the operative rule** — it names three specific cut points and the blocks they stop at, and leaving the ch-795 block
and everything from the Volume 13 close down is exactly what it prescribes — **and the block it names last is at line
6,005 of 6,090, so the difference between the two readings is 5,754 lines of history.** **No hot block that a Volume
14 writer reads was moved: the live position, the Volume 13 close, the Volume 14 planning and the Batch 0001 record all
stay whole.**

**Pruned: nothing.** No line was deleted, no heading dropped, no figure re-derived.

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
| `## How to read this file` | The cold-start reading order for the whole run. **Still valid as written. Its live-position entry was corrected to ch 523 at the Volume 9 Batch 0003 review and again to ch 538 at the Volume 9 close review repair.** |
| `## Who is where at end of chapter 538` | **THE LIVE POSITION.** ch 538, day 1,598, end of Volume 9, sixty chapters audited and repaired. Every earlier position block is superseded by this one. |
| `## Volume 9 close — the volume as a whole` *(in `state/continuity.md`)* | **READ SECOND.** The volume-level established facts for ch 479–538, the construction budget re-measured for all sixty chapters, and the twenty-six audit findings with what the repair pass did to each. |
| `## Volume 9 close audit — CLOSED` | **READ THIRD.** The audit's own record: twenty-six findings, none repaired at the time, and the class-by-class repair table. |
| `## Volume 9 close — REVIEW REPAIR` | **READ FOURTH.** The repair pass that cleared those findings on the page — eleven word-count claims, four calendar and staging defects, sixteen authorial-scaffolding lines, three retired tokens, one distance, fifty-eight trailing newlines, and the two state-file contradictions this index was corrected for. **No beat, day-table anchor, title, stage, bracket, mouth, irreversible decision or planned event moved.** |
| `## Who is where at end of chapter 523` | The Volume 9 Batch 0003 position, superseded by the ch 538 block. |
| `## Who is where at end of chapter 508` | The Volume 9 Batch 0002 position, superseded by the ch 523 block. |
| `## Where Volume 9 actually stands` | **READ THIS ALSO.** The three batches on the page, their days, their brackets, and the fact that Volume 9 is on its last batch. Its batch-count line predates Batch 0004; the ch 538 block above is the position. |
| `## Volume 9 Batch 0003 — REVIEW REPAIR` | **READ AFTER THAT.** Six findings closed and a seventh found while applying them: the transposed operand in the 258-day silence, the ch 522 day row short by three, the two carried-days notes reconciled to 1,557–1,560, four stale headers in this file plus three live pointers elsewhere, two duplicated paragraphs recast at ch 513 and ch 515, and the authorial heading at ch 518. **No beat, day-table anchor, title, stage, bracket or irreversible decision moved.** |
| `## Who is where at end of chapter 434` | The Volume 8 Batch 0001 position, superseded by the ch 508, ch 523 and ch 538 blocks. |
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

**LIVE READING INSTRUCTION, CORRECTED BY THE VOLUME 13 CLOSE. Volume 13 is planned, all four batches are on the page, and Volume 13 is closed, audited and reviewed.** Everything the section below says about Volume 13 being the live volume, and about `workspace/volume-13-batch-0001/PROMPT.md` being the one and only prompt a phase starting now may be sent to, is history and is not an instruction. **A phase starting now is VOLUME 14 PLANNING, and no `volume-14-*` prompt exists yet — the controller's seed step creates it. Until it does, the two files a phase starting now reads first are `outline/series.md` §9, which fixes Volume 14's title, its chapter range and its one-sentence goal, and `state/current.md` §*Who is where at end of Volume 13 — VOLUME 13 CLOSED AND AUDITED*, which is the live position.** The paragraphs after this one are left as the record of what Volume 11, Volume 12 and Volume 13 planning and batching read, and are not instructions. **Corrected in place by the Volume 13 close's review repair, which found this section still pointing at Volume 13 Batch 0001 and the archive sentence below still claiming the pass belonged to the Volume 13 close.**

**LIVE READING INSTRUCTION, CORRECTED BY THE VOLUME 13 PLANNING PHASE. Volume 11 planning is discharged, the Volume 11 close is
discharged, Volume 12 planning is discharged, Volume 12's four batches are on the page, and the Volume 12 close is discharged.** The
paragraph immediately below names VOLUME 12 PLANNING as the live brief and that is not true: **the one and only prompt a phase starting
now may be sent to is `workspace/volume-13-batch-0001/PROMPT.md`, VOLUME 13 BATCH 0001, ch 721–735, days 2,301–2,360, pressure *the
bundles*.** The `## Volume 13` section below is the only reading order, and it is now correct. The paragraphs after this one are left
as the record of what Volume 11 and Volume 12 planning read, and are not instructions. **Corrected in place by the Volume 13 planning
phase, which wrote `outline/volume-13.md` and that one batch card and nothing else.**

**LIVE READING INSTRUCTION. Volume 11 planning is discharged, and so is the Volume 11 close.** Volume 11 planning ran,
its four batches are on the page, and `workspace/volume-11-close/PROMPT.md` has been executed in full: ch 601–660 is
closed, audited and repaired, and it was the close that wrote `workspace/volume-12-planning/PROMPT.md`. **The phase now
being dispatched is VOLUME 12 PLANNING, and the one and only prompt it may be sent to is
`workspace/volume-12-planning/PROMPT.md`.** It reads, in this order: that prompt — **which is the whole brief: plan
Volume 12, ch 661–720, write `outline/volume-12.md` and `workspace/volume-12-batch-0001/PROMPT.md`, and nothing else** —
then `AGENTS.md` · `NOVEL_SPEC.md` · `OUTLINE_GUIDE.md` · `outline/series.md` in full · `outline/ending.md` ·
`outline/volume-11.md` as the model of a volume outline and as the authority on what Volume 11 settled · this file ·
`state/current.md` under ***Who is where at end of Volume 11 — VOLUME 11 CLOSED AND AUDITED*** ·
`state/continuity.md` under ***VOLUME 11 CLOSE — What He Was, ch 601–660***, ***VOLUME 11 BATCH 0004*** and
***VOLUME 11 BATCH 0004 — REVIEW REPAIR*** · `state/open-threads.md` under ***VOLUME 11 CLOSED AND AUDITED at
ch 660*** · `state/chapter-summaries.md` under ***VOLUME 11*** · `state/book-metadata.md` · the six `bible/` files ·
**chapters 641–660** · the four `workspace/volume-11-batch-000*/PROMPT.md` files for the shape of a batch card.

**Four things that must not be re-opened by Volume 12 planning:** **the eight inherited findings the Volume 11 close
left standing are live and are listed in the prompt, and the one finding the close review raised and did NOT uphold —
ch 659's eleven miles of made road — is recorded there too so it is not re-investigated** · **`forgiv` is 1 across
ch 601–660, not 0** — ch 659's `he would forgive`, a denial, invisible to the `\bforgiv\b` boundary — **and `the year`
is 2, not 0**, ch 618 naming it inside a refusal and ch 637 in an unrelated sense, **so any zero has to be measured
before it is claimed** · **`outline/ending.md` §8's five obligations all stand open and Volume 11 took none of them;
the volume may not be spent in a planning outline** · **the *Twenty-two days* line stays open and unplaced** — it
arrived at ch 536, is still unplaced in Volume 11, is equated to no dated interval anywhere, and **is a question the
series hands forward, not an error, so no Volume 12 planning card may resolve it.**

**Corrected at the Volume 11 close review.** This block previously said the volume was *"closed and audited at
ch 600"* and warned that *"A Volume 11 planning phase must not be sent to…"* — an instruction that had been stale for a
whole volume, because the close did not touch this file. **It is corrected here, and the paragraphs below are left as
the record of what Volume 10 planning was sent**, the same way Volume 7's discharged obligations were left standing.

**Volume 10 planning read, in this order:** `workspace/volume-10-planning/PROMPT.md` — **which is the whole brief:
plan Volume 10, ch 539–600, and write its first 10 to 20 chapter batch prompt, and nothing else** — then
`outline/series.md` §9 · `outline/volume-09.md` §*New question for Volume 10* · this file ·
`state/current.md` §*Who is where at end of chapter 538* · `state/current.md` §*Volume 9 close audit — CLOSED* ·
`state/current.md` §*Volume 9 close — REVIEW REPAIR* · `state/continuity.md` §*World rules* ·
`state/continuity.md` §*Volume 9 close — the volume as a whole* and its `— REVIEW REPAIR* ·
`state/open-threads.md` §*VOLUME 9 CLOSED AND AUDITED at ch 538* ·
`state/chapter-summaries.md` §*Volume 9*.

**Two things that must not be re-opened by the planning phase:** `outline/ending.md` does not open until Volume 10's own
planning has fixed its cards, and **the *Twenty-two days* line at ch 536 stays open and unplaced** — it is a question the
volume hands forward, not an error, and no planning card may resolve it.

**Corrected at the Volume 9 close review.** This block previously sent every phase to Volume 9 Batch 0004, which is
executed in full and closed; **corrected at the Volume 9 Batch 0003 review**, where it had sent every phase to Volume 8
Batch 0001 and its PHASE ZERO, four phases discharged earlier. **Both are corrected here and in the tables; the Volume 7
close repair order paragraph is left as written, because it is a record of a discharged obligation and not a reading
instruction.**

## Volume 13 — closed, and where a phase starting now should read

**VOLUME 13 IS CLOSED, AUDITED, AND REVIEWED. THIS IS THE ONLY READING ORDER IN THIS FILE.** The section above
is the record of what Volume 12 planning and Batches 0003 and 0004 read; it is history and the table in it is not a map of where the
manuscript is. A phase starting now reads these, in this order:

| Order | Section | What it is |
| --- | --- | --- |
| 1 | `outline/series.md` §9 | **THE LIVE BRIEF'S AUTHORITY.** Volume 14 is *The Scribe's Apprentice*, ch 781–840, and §9 fixes its one-sentence goal: *In this volume, Ning Yan must refuse the thing Yuan was offered and refused, or the whole bargain survives.* **No `volume-14-*` prompt exists yet and the controller's seed step creates it; a phase starting now plans Volume 14 against this section and against `outline/ending.md`, which owns the ending** |
| 2 | `state/current.md` §*Who is where at end of Volume 13 — VOLUME 13 CLOSED AND AUDITED* | **THE LIVE POSITION.** Day 2,540, the seventh of the month beginning 2,534, at the seventh hour, in the dark room, IMMORTAL VESSEL 6, nineteen, **981 days lighter, at `D − 1,559`**, three fingers and a thumb, the bar against the wall on the left, and a boy of sixteen in the doorway with an oil lamp. Measured: **118,951 body words over sixty chapters at average 1,983 — 29,923 · 30,152 · 31,000 · 27,876 by batch** |
| 3 | `state/continuity.md` §*VOLUME 13 — THE CLOSE* | The volume as a whole: every figure, the eight firsts, the lighter series, the lamp, the bar, the geography, the craft lines, the ending, and the eight disagreements with the outline all resolved in favour of the page |
| 4 | `state/continuity.md` §*VOLUME 13 CLOSE — REVIEW REPAIR* | **READ FOURTH.** The close's own review repair: six figures and six dates it corrected on the page, **including the bar's put-down day, which the close had canonised thirty days late**, and the three defects it found in the close's own state output |
| 5 | `state/open-threads.md` §*VOLUME 13 CLOSED* | **What Volume 14 inherits, what it may not settle, the four defects the close recorded without rewriting, and the four figures the review repair moved and Volume 14 must not misread** |
| 6 | `outline/volume-13.md` | **THE AUTHORITY for Volume 13**, read after the five above and never before. Goal, the eight structural decisions D1–D8, the stage table, the bracket budget, the batch plan, and **the whole 240-day calendar printed so a chapter can be checked without re-deriving it** |
| 7 | `state/current.md` §*Who is where at end of Volume 12* | **The position Volume 13 started from.** Day 2,300, one step up a second stair, IMMORTAL VESSEL 3, nineteen, 740 days lighter, three fingers and a thumb. Historical |
| 8 | `outline/series.md` §4 | **Fixes Immortal Vessel 4–6, all three of which she takes inside Volume 13, and Yuan's second rung** |
| 9 | `outline/ending.md` | **Owns the ending and the moral answer, and Volume 13 may not preview either.** Read by the Volume 14 planning phase before it writes anything |

**Every `workspace/volume-13-*` directory has been executed and is history: planning, four batches, close.** `chapters/volume-13/` exists and holds sixty chapters, 721 to 780, and the twelve volumes before it hold the seven hundred and twenty that come first, for 780 chapters in the book. **Corrected at the Volume 13 close's review repair, which found this section still naming Batch 0001 as the live brief and still stating that `chapters/volume-13/` did not exist.**

## Volume 12 — the live volume, and where a phase starting now should read

**LIVE, AND CORRECTED TWICE — THIS IS THE ONLY READING ORDER IN THIS FILE.** This section was added by the Volume 12 planning
review fix, rewritten by the Volume 12 Batch 0003 phase when that batch's state was written, and corrected a third time when the
batch's repair was itself reviewed. **Any earlier reading order stated in this section is history and is superseded by the table
below.** The tables above map Volumes 1 to 11 and were correct when written; they are not a map of where the manuscript is. A
phase starting in Volume 12 reads these sections, in this order, and nothing else in `state/` until it needs more:

| Order | Section | What it is |
| --- | --- | --- |
| 1 | `state/current.md` §*Who is where at end of chapter 705* | **THE LIVE POSITION.** Day 2,240, at the broken wall, IMMORTAL VESSEL 2, 680 days lighter. Measured per file: **29,240 body words, average 1,949, day 2,141–2,240**, and the volume at **88,074 over forty-five chapters at average 1,957**. Everything Batch 0004 inherits is in it |
| 2 | `state/continuity.md` §*Established facts, Volume 12 Batch 0003 — THE FIRSTS* | **READ SECOND.** The day table, the lighter series, the total and every figure in it, the board count, and the section headed ***How far the rows sit past the wall*** — **the open map finding, published in four numbers, which Batch 0003's own review adjudicated without settling and which no Batch 0004 card may put a mile figure on** |
| 3 | `state/continuity.md` §*VOLUME 12 BATCH 0003 — REVIEW OF THE REVIEW* | **READ THIRD.** The thirteen defects the review of the repair found, what each one was measured against, the four that were checkable by hand, and the two the first pass left standing on purpose |
| 4 | `state/continuity.md` §*VOLUME 12 BATCH 0003 — REVIEW REPAIR* | The nineteen defects the batch's own first review cleared, including the same arithmetic error repeated in two different months and the one repair made outside the batch. **Its word figures are the old page; read section 3 and row 1 for the live ones** |
| 5 | `state/open-threads.md` §*VOLUME 12 BATCH 0003 CLOSED at ch 705* | **The ten open threads**, the irreversible list, and the three things Batch 0004 must not inherit as clean prose |
| 6 | `state/current.md` §*Who is where at end of chapter 690* | **The previous CLOSED position**, and everything Batch 0003 inherited is in it. Its figures were corrected in place by the planning review fix |
| 7 | `outline/volume-12.md` | **THE AUTHORITY for the volume.** Not a state file. It is read after the six above, never before |

**`workspace/volume-12-planning/` is history.** Its prompt is not a live brief — it says it creates `outline/volume-12.md`, which
existed, and the phase that ran it audited rather than created. **`workspace/volume-12-batch-0003/PROMPT.md` is history too, and
it opens with a RESUME section saying its fifteen chapters must not be drafted again; that resume has been discharged.
**`workspace/volume-12-batch-0004/PROMPT.md` is the live brief** — VOLUME 12 BATCH 0004, ch 706–720, days 2,241–2,300,
*what is written on it*, with the seventh first at day 2,264 and the eighth at day 2,294 and **two firsts in the band and not
three**.

## The next time this is needed

`state/` is at ~1.13 MB hot and growing ~40 KB a phase. **At the Volume 8 close, run the same pass**: archive
everything behind the live volume out of `current.md`, `continuity.md` and `chapter-summaries.md` into a new file
under `state/archive/`, leave the stubs, and extend this index. **Do not prune.** `PHASE_SYSTEM.md` gives the
remedy as an index and an archive, not a deletion, and every one of these files is a record of what was measured
at the time it was measured. **Volume 12 is where that pass is now overdue:** the tables above stop at Volume 11 and
`current.md` still carries every block from Volume 1 forward. Volume 12 closed on 14 Oct 2026 and its close has been
reviewed and repaired. **THE PASS HAS STILL NOT BEEN RUN. `state/archive/` holds three files and covers Volumes 01–06 only, and `current.md` is now 5,884 lines and `continuity.md` 10,130. An earlier version of this paragraph said the pass belonged to the Volume 13 close; Volume 13 closed on 15 Oct 2026 and its close did not do it either, and the Volume 13 close's review repair corrected that false claim here rather than doing the pass. Nothing was pruned, moved or archived to make this sentence true.**

**Run it first in Volume 14 planning, before `outline/volume-14.md` is written.** It is a mechanical pass with its own risk: three of the files it touches are the three files Volume 14 planning reads, and archiving a block that is still the live position would be worse than the growth it fixes. Move only what is behind the live volume, leave every stub, leave the reading order in this file intact, and measure the same numbers before and after so the archive is provable rather than asserted.

**VOLUME 14 PLANNING NOTE (15 Oct 2026): the pass was NOT run before the outline.** One call could not
deliver the archive and the plan both well, so planning narrowed to `outline/volume-14.md` plus
`workspace/volume-14-batch-0001/PROMPT.md` per PHASE_SYSTEM.md's empirical rule. The pass is owed before
Batch 0002. Nothing was pruned, moved or archived to make this true, and the reading order above is
intact: a phase starting now reads `outline/series.md` §9, `state/current.md` §*Volume 14 planned* and
§*Who is where at the end of Volume 13*, then the Volume 13 close blocks.

**VOLUME 14 PLANNING REVIEW REPAIR (15 Oct 2026): the pass is still NOT run, and now it has an owner.**
The Volume 14 plan and its Batch 0001 card were reviewed and repaired — two wrong staleness figures, the
wrong last line of ch 780, a false premise about what the boy knows about the second place, four cards
restaging ch 780, a title that duplicated ch 779's, an uncounted second first of a month, and a batch with
no deadline. Full record in `state/continuity.md` under *VOLUME 14 PLANNING — REVIEW REPAIR*. **None of
that repair was the archive pass either, and this paragraph does not claim it was: `state/archive/` still
holds Volumes 01–06 only and `current.md` is 5,971 lines and `continuity.md` 10,282.** What changed is that
`workspace/volume-14-batch-0001/PROMPT.md` now instructs that the Batch 0002 prompt open with the pass as
its first job, before the ch 796–810 cards, with the same counts measured before and after. A phase
starting now still reads, in this order: `outline/series.md` §9, `state/current.md` §*Volume 14 Batch 0001
— REPAIRED* and §*Who is where at the end of Volume 13*, then `outline/volume-14.md`, then
`workspace/volume-14-batch-0001/PROMPT.md`, then the Volume 13 close blocks.

---

## ADDED 15 OCT 2026 — Volume 15 planning

**Three new sections, all in the hot files, none archived.** `state/phase-ledger.json` is controller-owned and was
not touched, and no phase-closure marker in `workspace/` was created or cleared.

| Section | File | Read it for |
| --- | --- | --- |
| `## Volume 15 planned — outline/volume-15.md exists and what the plan fixed` | `state/current.md`, at the foot | The live position, the eleven things the plan fixed, the four batches, and the next phase |
| `## VOLUME 15 PLANNING — what the plan fixed, what it refuses, and what Batch 0001 inherits` | `state/continuity.md`, at the foot | The machine-checked day table, the moral-answer rules, and the list of things Volume 15 may not spend |
| `## VOLUME 15 PLANNED — what it inherits, what it opens, and what Batch 0001 must not walk past` | `state/open-threads.md`, at the foot | The ten Volume 14 threads carried, the nine threads Volume 15 opens, and Batch 0001's bans |
| `## VOLUME 15 PLANNED — *The Scribe*, ch 841–900. NO CHAPTER PROSE.` | `state/chapter-summaries.md`, at the foot | The four batches in one table and the fixed day table |

**The cold-start pointer in `state/current.md` under *How to read this file* was corrected in place**: it named
*Who is where at end of chapter 765 — VOLUME 13 BATCH 0003* as the live position, which stopped being true when
Volume 13 closed. It now names the Volume 15 planning block. **Nothing was deleted and no historical block moved.**

---

## ADDED 15 OCT 2026 — Volume 15 planning, REVIEW REPAIR

**One new section, and six edits in place across four files.** `state/phase-ledger.json` is controller-owned and was
not touched, **no phase-closure marker in `workspace/` was created or cleared**, nothing under
`workspace/continuation/` was written, and **no new `workspace/volume-15-*` directory was created** — the next
phase prompt belongs to the drafting phase.

| Section | File | Read it for |
| --- | --- | --- |
| `## VOLUME 15 PLANNING — REVIEW REPAIR` | `state/continuity.md`, at the foot | The four findings, the Volume 14 precedent that settles the first of them, the re-measured table, and what was deliberately not acted on |

**The one finding that mattered was a first of the month deleted from the calendar.** The band 2,781–2,960 holds
**six** firsts under `((day − 134) mod 30) + 1`, not five: **2,804 · 2,834 · 2,864 · 2,894 · 2,924 · 2,954**. The
plan listed five and dropped 2,834, and the rule printed beside the list held only because of the drop.
**2,834 falls in the gap between ch 859 and ch 860 and is now landed by both chapters** — named once out loud at
ch 859, which is the thirtieth, and counted inside a figure of forty at ch 860, which is the third. **That rule is
Volume 14's own**: 2,624 fell in the gap between ch 800 and ch 801 and was landed by both.

**Five files carried the five-item list and all five now carry six.** `outline/volume-15.md` (twice, plus a new
*Corrections recorded after the review of this outline*), `outline/batches/volume-15-batch-0002.md` (the day table,
a standing note above it, and a sixth required world reveal), `state/current.md`, `state/continuity.md`,
`state/chapter-summaries.md`.

**A stale present-tense claim was corrected in `state/open-threads.md`.** Its *Phase closure markers* row said
`workspace/volume-14-batch-0004/` still held four markers the controller cleared in commit `d0f4683`, and that no
state file claimed the phase closed — which the same commit's own `state/current.md` does. The row now names what
was wrong and carries the standing rule: **markers under `workspace/` are controller-owned, and a state file
records only what it can see on disk and never asserts that a phase is open.** **The past-tense record of the same
event in `state/continuity.md` under *VOLUME 14 BATCH 0004 — REVIEW REPAIR* was left alone, because a past-tense
record of a superseded state is not the defect.**

**`state/book-metadata.md` gained the three entries it was missing** — Volume 13, Volume 14 and Volume 15 — with
every figure re-measured at the repair rather than copied: **Volume 13 is 118,951 words of body prose on method B
over sixty chapters at average 1,983, per batch 29,923 · 30,152 · 31,000 · 27,876; Volume 14 is 121,530 at average
2,026, per batch 31,117 · 29,402 · 30,995 · 30,016.** The file's missing entries for Volumes 1, 10 and 11 are
recorded in the file rather than passed over.

**Nothing in the day table moved.** Sixty rows, 2,781 → 2,960, strictly increasing, no two chapters on one day,
all four cards and the Batch 0001 prompt day-for-day identical to the outline. **Batch 0001's band holds exactly
one first, at ch 850, so `workspace/volume-15-batch-0001/PROMPT.md` needs no change and was not touched.**

## ADDED 15 OCT 2026 — Volume 16 planning

**One new section in each of the four hot state files, and no archive pass was run or needed: the four files grew by
under 20 KB between them, against a hot `state/` of about 1.15 MB and an archive threshold set by the second pass
above.** `state/phase-ledger.json` is controller-owned and was not touched, **no phase-closure marker in `workspace/`
was created or cleared**, and **no `workspace/volume-16-*` directory was created other than
`workspace/volume-16-batch-0001/`, which holds the one next-phase prompt this phase is required to write.**

| Section | File | Read it for |
| --- | --- | --- |
| `## Volume 16 planned — outline/volume-16.md exists and what the plan fixed` | `state/current.md`, at the foot | The cold-reader position, the plan's ten fixed decisions, and what this phase did not deliver |
| `## VOLUME 16 PLANNING — what the plan fixed, what it refuses, and what Batch 0001 inherits` | `state/continuity.md`, at the foot | The seven-sentence chain, the nine binding structural rules, the re-derived firsts and the measured hundred-row day table |
| `## VOLUME 16 PLANNED — what it inherits, what it opens, and what Batch 0001 must not walk past` | `state/open-threads.md`, at the foot | Every open thread and the plan's disposition of each, the word budgets, and **the one thread this phase deliberately left open** |
| `## VOLUME 16 PLANNED — *The Last Announcement*, ch 901–1000. NO CHAPTER PROSE.` | `state/chapter-summaries.md`, at the foot | The volume in one compact pass: seven batches, one hundred chapters, nineteen years |

**The one thing that will be forgotten if it is not written down:** **cards for Volume 16 Batches 0004, 0005, 0006
and 0007 do not exist.** They are outlined in `outline/volume-16.md`'s batch table and its hundred-row day table, and
a planning phase must write them before Batch 0004 is drafted. **The next four phases are drafting phases, and the
fifth is where this will otherwise be discovered at the wrong moment.**

**The day table was re-derived by script before a word of the plan was written, which is the check the Volume 15
planning review demanded of that volume and which caught a deleted first there.** One hundred rows, days 2,961 to
9,800, strictly increasing, no two chapters on one day, every ordinal under `((day − 134) mod 30) + 1`. **Six firsts
of a month fall before the fall and all six land on a chapter** — 2,984 · 3,014 · 3,044 · 3,074 · 3,104 · 3,134 —
**and the plan names the last of them, at ch 965, as the last bundle that will ever come up nine hundred and four
steps.** Nothing in the plan moves a chapter, a day, a batch title, a midpoint, a climax, a stage, a bracket or any
element of `outline/ending.md`.

## ADDED 15 OCT 2026 — Volume 16 planning REVIEW REPAIR

**Review of `next-0013` (commit `0b9dec8`), the Volume 16 planning phase. Planning files and state files only: no
chapter prose was written, no chapter of Volume 16 exists, no plot was moved, and no controller file was touched.**

| Section | File | Read it for |
| --- | --- | --- |
| `## Volume 16 planning REVIEW REPAIR, 15 Oct 2026 — eleven findings, no prose written, no plot moved` | `state/current.md`, at the foot | The twelve defects, what each was and what it is now, and the four cards that now exist |
| `## VOLUME 16 PLANNING — REVIEW REPAIR, 15 Oct 2026. The nine findings, and the three found alongside them` | `state/continuity.md`, at the foot | The finding-by-finding table, why the bracket budget was the worst of them, and what the repair did not do |
| `## VOLUME 16 PLANNED — REVIEW REPAIR, 15 Oct 2026. One thread closed, twelve figures fixed, and what stays open` | `state/open-threads.md`, at the foot | The one closed thread, the twelve figures the next four phases will quote instead of re-deriving, and what is still refused |
| `## VOLUME 16 BATCH 0004 — REVIEW REPAIR, 15 Oct 2026. Twenty-four findings, nine chapters, no chapter restarted` | `state/continuity.md`, at the foot | The finding-by-finding table, the nine spoken figures that did not re-derive, and what the repair did not touch |
| `## What the Batch 0004 review repair changed, 15 Oct 2026, and what it did not` | `state/current.md`, at the foot | The cold-reader version of the same repair, with the four-hundred, the lamp, the firsts and the market-day facts a drafter must take from here |
| `## VOLUME 16 BATCH 0004 — REVIEW REPAIR, 15 Oct 2026. What moved, what did not, and the one line a drafter of Batch 0005 must not re-derive wrongly` | `state/open-threads.md`, at the foot | That no thread moved, three re-derived carried facts, the counts after the repair, and the lesson the next batch has to act on |
| `### Batch 0004 review repair, second pass — twenty-three more findings, of which nineteen were applied` | `state/continuity.md`, at the foot | The second table, the four findings that were checked and rejected, and the hands, which is a canon question for the volume close and not a Batch 0004 defect |
| `### OPEN CANON ITEM raised by the Batch 0004 review repair, 15 Oct 2026 — the hands, and which of them is the working one` | `state/open-threads.md`, at the foot | Three answers to one fact across sixteen volumes, and what the volume close has to do about it |

**The one thing that will be forgotten if it is not written down: cards for Volume 16 Batches 0004–0007 existed for
no phase to write.** The chain is 0001 → 0002 → 0003 → 0004 and each drafting phase writes only the next prompt, so
Batch 0004 was going to stall on an empty slot at the fifth phase. **All four cards are now on the page in
`outline/batches/`, and their day tables were checked against the outline's hundred-row table day for day.**

**The twelve figures, all of which were inherited numbers that did not reproduce:** the descent is **sixteen days**
inclusive, not thirty-nine · her figures' anchor is **the first** of the month beginning 2,864, not the eighth ·
ch 910 is the **first** first of the volume · **eight** firsts land on a chapter, and 3,164 is the seventh and the
first with nothing on it · ch 982 is the **seventh** day of the fall · the bracket budget is **2 / 3 / 1 / 1 / 1**
across Batches 0001–0005 and none after, because **ch 918 falls inside Batch 0002 and no card accounted for it** ·
the descent's *first time in … days* is **783**, from the room series the Batch 0001 prompt carries · Volume 16 now
has a **word band of 1,450–2,700 a chapter**, derived from Volume 15's measured 1,455–2,178 · and **`nobody` and
`eleven` are 42 and 26 across Volume 15, not 0**, so Volume 16's line of thirty is a deliberate tightening that a
batch going over has to write down beside the number.

**Volume 16 Batch 0004 was reviewed on 15 Oct 2026 and repaired: twenty-four findings across nine chapters, no
chapter restarted, no plot moved.** The reviewer's own run was cut off before it could write a verdict, and what
`logs/volume-16-batch-0004.review.log` contains is its check commands — every completed check came back clean, and
the last line of the file is a rejected shell call. The repair was made against the committed prose and those
checks. **Nine of the twenty-four findings were spoken figures that did not re-derive against their own day, and
every one of the nine sat inside a scene rather than in a morning block**, which is how the batch closed with a note
claiming that all fifteen chapters' spoken figures reproduced. The rest were a lamp out *since the fourteenth* on
the fourteenth, a morning block at the sixth hour where the volume keeps them at the ninth, a chapter calling the
twenty-ninth the last day of a month one chapter before the thirtieth, two references to the wrong day for Dai
Yu, two hours running backwards and a second day inside the midpoint chapter, **fourteen people whose count rose
without a single binding being said**, a bundle on the eleventh of a month, a duplicated section heading and two
that ran into their neighbours, an underived number that contradicted its own chapter, and a count one short of the
three hundred and ninety-nine the climax needs.

**The second pass found nineteen more defects in Batch 0004 and rejected four of the twenty-three it raised**, including a
claim that ch 947's day figures were a day out — they are not, and the three figures in that chapter agree with
each other before they agree with the table. It also turned up a canon question that is not this batch's to
settle: **three fingers and a thumb on the left hand, against three fingers and a thumb on each in ch 903, 908,
919 and 920, against four fingers and a thumb on the right hand in the early volumes.** That is now an open item
at `state/open-threads.md` for the Volume 16 close.
