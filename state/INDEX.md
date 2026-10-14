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

## Volume 13 — the live phase, and where a phase starting now should read

**VOLUME 12 IS CLOSED, AUDITED, AND REVIEWED. THIS IS THE ONLY READING ORDER IN THIS FILE.** The section above is the
record of what Volume 12 planning and Batches 0003 and 0004 read; it is history and the table in it is not a map of where
the manuscript is. A phase starting now reads these, in this order:

| Order | Section | What it is |
| --- | --- | --- |
| 1 | `workspace/volume-13-planning/PROMPT.md` | **THE LIVE BRIEF.** Plan Volume 13, *The Immortal Court*, ch 721–780; write `outline/volume-13.md` and `workspace/volume-13-batch-0001/PROMPT.md`, and nothing else |
| 2 | `state/current.md` §*Who is where at end of Volume 12* | **THE LIVE POSITION.** Day 2,300, one step up a second stair, IMMORTAL VESSEL 3, nineteen, 740 days lighter, three fingers and a thumb. Measured per file: **116,766 body words over sixty chapters at average 1,946 — 29,996 · 28,850 · 29,240 · 28,680 by batch** |
| 3 | `state/continuity.md` §*VOLUME 12 CLOSE* | The volume as a whole: every figure, the eight firsts, the lighter series, the board, the geography, the craft lines, the ending |
| 4 | `state/continuity.md` §*VOLUME 12 CLOSE — REVIEW REPAIR* | **READ FOURTH.** The four sentences the close's review repaired, the two dated values it set deliberately, what it re-measured, and what it recorded without repairing |
| 5 | `state/open-threads.md` §*VOLUME 12 CLOSED* | **What Volume 13 inherits, what it may not settle, and the one new standing fact: the bar is dated nowhere and was taken up at nine** |
| 6 | `outline/volume-12.md` | **THE AUTHORITY for Volume 12**, read after the five above and never before |
| 7 | `outline/series.md` | **§9 fixes Volume 13's title, its chapter range and its one-sentence goal**, and §4 fixes Immortal Vessel 4–6 and Yuan's second rung |

**`workspace/volume-13-planning/` holds the one and only next phase.** No batch directory beyond it exists, no
`workspace/volume-13-batch-0001/` exists yet, and no `.done` marker anywhere is written by hand.

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
`current.md` still carries every block from Volume 1 forward. **Volume 12 closed on 14 Oct 2026 and its close has been
reviewed and repaired, so the archive pass now belongs to the Volume 13 close rather than to this phase; nothing was
pruned or moved to do it.**
