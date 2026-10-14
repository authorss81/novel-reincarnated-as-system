# Volume 8 Close — ch 421–478 — auditing prompt

## What this phase is

**Volume 8 is complete on the page at ch 478. All four batches are written. Batch 0004 (ch 465–478) has been through
review and through one repair pass, which is recorded below. Batches 0001 (ch 421–434), 0002 (ch 435–449) and
Batch 0003 (ch 450–464) have each been through their own batch reviews and have not been audited at the level a
volume close gives.**

**This phase audits the volume. It does not draft, and it does not rewrite.**

**`outline/volume-08.md` is the authority for Volume 8 and is not to be re-planned.** Its §*Power progression* table
is the authority on the day for every Nascent Soul stage, its §*Required continuity facts to preserve after the
volume* is the list this phase must walk, and its §*New question for Volume 9* is what Volume 9 opens onto and is
not to be previewed, expanded or softened here.

## THE RULE THIS PHASE EXISTS TO ENFORCE

**This phase writes this prompt's own output and nothing else.**

- **It writes no chapter prose. Not one line of ch 421–478 is rewritten here.**
- **It writes no second prompt.** There is no `volume-08-batch-0005`, no `volume-08-close-record` directory, and no
  other `workspace/volume-0*` directory. If the audit finds something Volume 9's planning phase must know, it goes in
  this phase's own record, on the page, where the next phase will read it.
- **It writes no `.done` marker.** `PHASE_SYSTEM.md` gives that to the controller alone.
- **It does not open `outline/`.** `outline/series.md`, `outline/ending.md` and `outline/volume-08.md` are
  authorities. If this phase finds an error in one of them, it records the error in `state/` under its own heading
  and does not edit the file.
- **It edits only the state files this prompt names in *Deliverables*, and it edits them in place, appending rather
  than pruning.** `state/current.md` is never pruned by any phase and a wrong section in it is corrected in place
  with a note saying so, not deleted.

**A close that improves the volume by writing chapter prose is a close that has become a rewrite, and the four
earlier volumes in this run each have a record of what happens when that happens: dozens of reopened chapters, the
voice drifting, and the audit's own repairs becoming the defects the next reviewer hunts.** This one audits. **Where
it finds something, it records it and says plainly that it is for a repair phase and not for this one.**

## Why this phase is here at all, and why it is here now

**The Batch 0004 drafting phase wrote `workspace/volume-09-planning/PROMPT.md` instead of a volume-close prompt. That
was a defect and it was upstream, not in the drafter: `workspace/volume-08-batch-0004/PROMPT.md` names that file as
the one next phase, and the drafter complied. Volumes 5, 6 and 7 each ran `-close` between their final batch and the
next volume's planning. Volume 8 did not.**

**The concrete cost, and the reason this is a must-fix rather than a tidiness note:** with no close phase, Volume 8's
fifty-eight-chapter figures are **self-certified by the phase that wrote fourteen of the fifty-eight chapters**, and
the three-batch figure discrepancy that the batch phase recorded and declined to reconcile had no phase left to
settle it. `workspace/volume-09-planning/` has been removed from the tree and this phase is the one next phase.

**Part of that discrepancy has since been explained, and this phase inherits the explanation rather than the
mystery.** See *The word-count discrepancy, resolved* below. The rest is this phase's to settle.

## What is on the page

**`chapters/volume-08/` holds ch 421–478, fifty-eight chapters.** Word counts below are measured by one script on the
files as they stand after the Batch 0004 repair, and **the method is in the sentence with every number.**

**Body prose, method A — every line not beginning `# ` (the chapter title line excluded, `##` section headings
counted as prose):**

| Batch | Chapters | Days | Words | Average |
| --- | --- | --- | --- | --- |
| 0001 | 421–434 | 1,091–1,152 | 28,334 | ~2,024 |
| 0002 | 435–449 | 1,153–1,205 | 21,869 | ~1,458 |
| 0003 | 450–464 | 1,206–1,262 | 28,341 | ~1,889 |
| 0004 | 465–478 | 1,263–1,340 | 29,125 | ~2,080 |
| **volume** | **421–478** | **1,091–1,340** | **107,669** | **~1,856** |

**Body prose, method B — every line not beginning `#` (the title line and every `##` section heading excluded):**
**0001 27,666 · 0002 21,681 · 0003 27,879 · 0004 28,620 · volume 105,846.** Both figures are recorded because this run
has published both and a reader of either one alone will think the other is wrong.

**Batch 0004 per chapter, method A, post-repair:** **465 2,463 · 466 1,817 · 467 2,313 · 468 1,873 · 469 1,796 ·
470 2,560 · 471 2,042 · 472 2,109 · 473 2,041 · 474 2,549 · 475 1,950 · 476 1,825 · 477 1,908 · 478 1,879.** Nothing
is under the 1,300 floor; **ch 469 at 1,796 is the only chapter in the batch under the 1,800 guide** and nothing is
above the 2,700 guide.

### The word-count discrepancy, resolved

**The Batch 0004 phase recorded that its re-measure reproduced Batches 0001–0003 higher than those batches' own
recorded blocks by 668, 188 and 462 words, and recorded it as unexplained. It is explained, and the explanation is
arithmetic, not editorial.**

**The 668 / 188 / 462 is exactly the `##` section-heading word count in each of those three batches.** Method A
keeps section headings in the prose and method B excludes them, and **28,334 − 27,666 = 668 · 21,869 − 21,681 = 188 ·
28,341 − 27,879 = 462.** Batches 0001–0003 measured their own tables by method B. The volume re-measure used method
A. **The batches' own figures were never wrong; two counting conventions were in use at once and the note describing
the script was wrong about which one it ran.** No chapter before ch 465 was touched and none needed to be.

**This phase settles it: pick one convention for Volume 8, say which in the same sentence as every number, and
correct the method note at `state/continuity.md` §*Volume 8 as a whole, closed, re-measured* and §*Established facts,
Volume 8 Batch 0004* in place.** The figures above are both, taken now, and either may be adopted provided the
method travels with it.

### A second thing the re-measure turned up

**Twenty-nine chapter files in Volume 8 have no trailing newline** — Batch 0001's fourteen, Batch 0003's fifteen, and
none in Batch 0002 or Batch 0004. **The Volume 7 close fixed 250 such files as an operational repair and recorded it;
Volume 8 has reintroduced 29.** A missing trailing newline is invisible in a word count but it is how a chapter that
ends without a line break collides with the next file in a concatenated read, which is precisely how method A and
method B came to disagree by a figure nobody could place. **Record it. Fixing twenty-nine bytes is a repair phase's
job and not this one's.**

## The repair that has already run on Batch 0004

**The review of `volume-08-batch-0004` returned nine findings. All nine are closed on the page. Full record at
`state/continuity.md` §*Volume 8 Batch 0004 — REVIEW REPAIR*.** A close that reopens these nine and re-decides them
has undone the repair and not audited the volume. For the record, and because three of them changed figures:

1. **ch 478 contradicted itself on how many times she has said his name.** An early line said eleven answered and
   about thirty unanswered in seven years; the closing beat said eleven in seven years, four answered, this the
   twelfth. **The count now stands once, at the first statement: eleven occasions in seven years, four answered, and
   this is the twelfth.**
2. **ch 474 counted the refusal as both the third time and the fourth entry.** Three refusals is right; four entries
   in books is right; the chapter said both in the same scene and the state files inherited both. **Now: three
   refusals, four entries, Xie Changyin's mouth says four.**
3. **ch 470 carried a bare volume citation — `since Volume 4`.** Recast to ground. **Authorial scaffolding across all
   fifty-eight chapters of Volume 8 is 0 on the widened pattern, re-measured after the repair.**
4. **`about ten seconds` at ch 466 and `about four minutes` at ch 473** were the retired hedged-duration construction
   in recast form. Both are plain counts now. **The family did not go to zero and the record must stop claiming it
   did** — see *The counts this phase must not get wrong*.
5. **ch 474 restated *there is no hand that takes it out* four times.** It now does it twice: once in her mouth with
   Xie Changyin's confirmation under it, once at the close.
6. **An unexplained byte-identical duplicate paragraph** at ch 470 and ch 476 is broken. The two remaining
   duplicates in the batch are deliberate and recorded — the bill figure at 466/467 and the anonymity line at 475/478.
7. **`eleven` stood eleven times in ch 478 and thirteen in ch 465.** Now 9 and 11. The instances that were carrying
   arithmetic were kept; four were cut.
8. **The volume-close phase was missing.** This phase.
9. **`state/current.md`'s *Next phase* bullet had the live prompt buried under two thousand characters of superseded
   prompt.** Corrected in place.

**Two defects the review did not find were found while repairing them and are also closed: a date in ch 470 that put
the form-reading on the twelfth of a month five days after the eighteenth, when the outline's own day table and ch 473
both put it on the first of the month beginning 1,304; and ch 476's *eleven days at the top of a realm*, where the
stage is at day 1,291 and ch 476's fourteenth is at day 1,317, so it is twenty-six.** Both are recorded as taken.

## The counts this phase must not get wrong

**Every figure below has been wrong at least once in this run, in both directions — a budget that recorded zero while
instances stood, and a budget that recorded a count where there was none. Re-derive each one and write down the
true number with the method beside it.**

| What | What is on the page now | What to do |
| --- | --- | --- |
| Authorial scaffolding, the widened pattern | **0 across all fifty-eight chapters**, re-measured after the Batch 0004 repair | re-derive. A pattern that requires a numeral returns zero by construction and proves nothing; use `this (chapter\|volume\|book)` · `the reader` · `the rest of the book` · `(in\|another) batch` · `[0-9]+ volumes?` · `\bthe volume\b` · `\b[Vv]olume\b` · `\bmidpoint\b` · `\bch [0-9]{3}\b` |
| Bracketed layer lines | **2 in fifty-eight, at ch 434 and ch 470**, character-identical to the twelve earlier stage lines but for the ordinal | **two is the volume's budget and both are spent. Volume 9 opens on no bracket.** Count it; do not add to it |
| Named weekdays · named calendar months · named weeks | **0 · 0 · 0.** The fifteen `May` hits on a case-insensitive grep are **all the modal *may*** and none is a month | re-derive; if a month is found, the finding is for a repair phase |
| Retired calendar vocabulary | *about four seconds* **0** · *eleven weeks* **0** · *fortnight* **0** — but the **hedged short-duration family is not zero**: fourteen instances of *about nine seconds / about nine minutes / about three seconds / about two minutes / about two seconds* stand across the volume, and the two the Batch 0004 review named were recast | **the record must stop claiming the category is clean.** Write down the true count of the family with its method, and say plainly that the retired three are zero and the family is not |
| *About…* | **136 across Batch 0004**, body prose, whole word, after the repair | measured with the method in the sentence. Volume-wide is not measured and should not be asserted |
| *Whole of* | **16 across Batch 0004**, reproducing Batch 0002's 17 and Batch 0003's 17 across fifteen | the spine of the voice. Xie Changyin's *that is the whole of it* is a character's habit and stays |
| Longest paragraph | **95 words, at ch 471.** Five paragraphs are over 90, across 915 paragraphs measured in the batch | over 90 is the working limit, over 120 the hard one. Record which chapter and which figure |
| Exact duplicate paragraphs | **2 in Batch 0004**, both deliberate and both recorded | the other volume-scale duplicates are furniture — recurring eight-word openings — and the difference between furniture and a slip is the difference between a thing and an accident |
| Chapter titles | **478 `#` headings manuscript-wide, zero collisions, longest 39 characters** | counted as the heading text after the `#`, spaces included, marker excluded |
| Forbidden terms | `licence` / `license` **0** · `plate` **0** · `bargain` **0** · `kill` **0** · `murder` **0** · `Ledger` **0** · `kiln-born` **0** · `MEMBER ABSENT` **0** · `reconciled` **0** · `Feng` **0** · `Ning Wu` **0** · `Anchor` **0** · `Sisterhood` **0** · `Scribe` **0** · `Lung` **0** · `appointment` **0** · `clearance` **0** · `countersignature` **0** across Batch 0004, word-bounded | **`plate` and `Order` both return false positives inside ordinary words and both have caught this run out.** `Order` returns 3 across the batch, all of them the name given once at ch 425 |
| Days | 1,091 to 1,340, 250 days; **the month-day of any day is `((day − 134) mod 30) + 1`** and is derived, never asserted | **day 1,340 is the seventh of the month beginning 1,334, not of the month beginning 1,304 — the Batch 0004 prompt's own table got that row wrong and the deviation is recorded** |

## The sixteen continuity facts, walked one at a time

**These are `outline/volume-08.md` §*Required continuity facts to preserve after the volume* — Volume 8's hand-off to
Volume 9.** They are walked, one at a one at a time, at `state/continuity.md` §*The sixteen continuity facts, walked
one at a time, against the chapters*, and restated as hand-off items at `state/current.md`
§*Who is where at end of chapter 478*.

**This phase walks all sixteen against ch 421–478 and writes down which ones hold, which ones hold in a changed form,
and which ones do not. A fact that holds is not a fact the next phase can rely on unless this phase has said so.**

**The four that cost something to keep, because they are the four a volume close is most likely to find broken:**

- **The relicensing legs stay in order — clearance → seal → countersignature — and Volume 8's allowance for all
  three is 0.** No stage-day, clearance, seal or countersignature is shown anywhere in ch 421–478 and **no card may
  say one was or was not required.**
- **The relicensed licence stays unopened.** It has been against her ribs for four years, she put it there herself
  with her own hands, it says Foundation the first stage on the front of it, and **the word `licence` / `license`
  returns 0 across all fifty-eight chapters of Volume 8.** Its worth was raised at ch 470, ch 476 and ch 478 and it
  was never read.
- **The year of non-forgiveness is still running and the subject was mentioned zero times in fifty-eight chapters.**
  She does not forgive him and she does not tell him to stop. **At ch 466 he gives her a bill in a number and she
  does not thank him for it**, and at ch 478 he has had nothing to spend for eighty-four days and there is nothing
  left to answer with.
- **No figure of what is left of him is stated on any page.** The bill is a figure of a total and not a figure of
  him, and the last figure of him in the manuscript is *about six weeks* at ch 236.

**And the five Volume 9's antagonist could most easily walk over:** Feng never on the page until Volume 11 ·
*kiln-born* stays in two heads and on no paper · the register still reads *reconciled* and is not read · the Clay
Plate is worn and undescribed (named once, at ch 441, and described in no chapter) · **the surface answer at ch 267
is never re-voiced in any mouth, and the Order's reason for anything is never given.**

## What this phase must not do

- **Must not write chapter prose.** Volume 8's ch 478 is a quiet ending by design and it is not to be improved,
  extended, tidied or rewritten. It is the last page of the volume.
- **Must not preview the ending**, in any form, in any mouth.
- **Must not introduce a final enemy.** The Scribe belongs to Volume 15 and `outline/ending.md` fixes it there.
- **Must not turn any office or person into a villain.** **The Order's answer to a refusal is silence, not
  persecution, and a close that reads that as softness has stopped auditing and started rewriting.**
- **Must not re-derive Volume 9's material.** `outline/ending.md` §1 records that Shuyin survives Volume 9 and is
  alive, old, and not thanked at its close. **Nothing this phase writes may spend either of those.**
- **Must not carry a figure it has not measured.** Every count is a figure measured on the files as they stand, and a
  figure measured by a phase that has not read the files is a promise.
- **Must not re-open a chapter to fix what the audit finds.** Record it, name it, and say it is for a repair phase.

## Deliverables

1. **`workspace/volume-08-close/SUMMARY.md`** — the audit's hand-off: a table of findings with a verdict on each, a
   list of repairs for a later phase with a count, the sixteen continuity facts walked, and the single-file
   hand-off. **This file is never pruned by any phase.**
2. **`state/current.md`** — **Volume 8 marked closed and audited**, the running bullets corrected in place, and a
   new `## Volume 8 close audit — CLOSED` block in the shape the Volume 7 close wrote its own.
3. **`state/continuity.md`** — `## Volume 8 close — repairs` if the audit finds anything to record, and
   `## Volume 8 close — the volume as a whole` carrying the settled per-batch and per-volume figures under **one**
   stated method, the re-derived bracket count, and the full measured construction budget **with the method named in
   the same sentence as every number.** Append; do not prune.
4. **`state/open-threads.md`** — the state of every thread at ch 478, Volume 8's own additions separated from the
   carried ones, and an explicit line saying which threads Volume 9 inherits live.
5. **`state/chapter-summaries.md`** — `## Volume 8 closed — audited`, the volume-level entry, one line per batch and
   one line per structural item, and the volume's closing image.
6. **`state/book-metadata.md`** — Volume 8 marked closed and audited, with the corrected volume figure under the
   method this phase settles on.
7. **`workspace/volume-09-planning/PROMPT.md`** — **exactly one follow-up prompt, and no more.** See below.

## The one next phase

**Volume 9 planning, at `workspace/volume-09-planning/PROMPT.md`, and nothing else.** It writes `outline/volume-09.md`
and no chapter prose, and it is Volume 9's business that it is Volume 9's business.

**Volume 9 is *The Warden*, ch 479–538.** Its goal is fixed by `outline/series.md` §9 and is **not to be
re-derived:** *In this volume, Ning Yan must survive Shuyin, or the walls stay and the reason for them goes
unrecorded.* **The question Volume 9 opens onto is fixed at `outline/volume-08.md` §*New question for Volume 9* and is
not to be re-derived either**, and the first line of Volume 9's first chapter and the whole of its first scene is
this, from ch 478: **she said his name once into a shed with boards on the floor, nothing came back, and she waited
anyway.**

**Constraints the next prompt must carry, and must not re-open, preserved here so that they cannot be lost when
`workspace/volume-09-planning/` was cleared to insert this phase:**

- **`outline/ending.md` §1: Shuyin released the Anchor list in Volume 10 and is alive, old, and not thanked.** He
  survives Volume 9 and is not thanked at its close. Per `outline/series.md` §6 he is nine hundred years old, he
  keeps a list, and **some of the names on it are his friends** — he is honest, and he is not a villain, and this is
  a plan for how to write him, not a problem to solve.
- **The series' ending is not Volume 9's to reach.** Do not name Feng's death, do not place the Anchor, do not touch
  the Sisterhood, do not put the bargain on the table, do not show a budget for the Order, and **do not re-voice the
  ch 267 surface answer in any mouth.**
- **Severance 1–9 in Volumes 9–11**, per `outline/series.md` §4, and its cost for the realm is ***she stops being able
  to go home*** — **the first cost in this run that is about a place and not about a body.** Nothing in §4 is moved
  and no gap is left for a drafting phase to invent. **Volume 9 opens on day 1,341, the eighth of the month beginning
  1,334**, derived under `((day − 134) mod 30) + 1` and not asserted.
- **Volume 10 is *The List*, ch 539–600**, goal fixed by `outline/series.md` §9: *In this volume, Ning Yan must find
  her brother before the Warden's list closes for good, or Ning Wu stays a name on a page for another decade.*
- **The Warden is a man with a list and a rule and a body nine hundred years old. A plan that turns him into a
  building is a plan that has begun inventing furniture**, and `outline/ending.md` requires him alive, old and not
  thanked at the end of this one, which is much harder to do with furniture than with a person.
- **Volume 9 must be visibly a different book from Volume 8.** Volume 8 ran on seduction and a building with a
  hundred lamps in it. Another building full of competent people offering her a better version of the same thing is
  not a new volume.

## The shape of the output

**A close in this run is a table of findings with a verdict on each, a list of repairs with a count, and the sixteen
continuity items walked one at a time.** Where a previous volume's close found nothing, say so and move on. **Where
it found something, do not fix it here — record it, and say plainly that it is for a repair phase and not for this
one.**

**The one thing this close must get right is Volume 8's own answer.** She read the sheet to them first, and then she
said no, and a man of sixty-one wrote one line and the date in the ordinary hand. **It went in. There is no hand in
that building or on that ground that takes it out. It is the fourth entry of her life and the first one she chose,
and the price of it is not punishment: the ground went quiet, and at the last page nothing on nine days of road
wants anything from her at all.** **If a finding in this audit appears to weaken that, the finding is wrong and the
page is right.**