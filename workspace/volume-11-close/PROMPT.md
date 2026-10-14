# VOLUME 11 CLOSE — *What He Was*, ch 601–660 — PROMPT

## What this phase is

**`chapters/volume-11/` is COMPLETE on the page: sixty chapters, ch 601–660, day 1,831 to day 2,060, four batches
drafted, and the last of them written by the phase that dispatched this prompt. This phase CLOSES THE VOLUME. It audits
`outline/volume-11.md` section by section against the sixty chapter files, records every finding, repairs on the page
what the walk finds to be a defect, and produces the volume's own close record.**

**It writes no new chapter prose, it writes no second prompt and no `.done` marker — which `PHASE_SYSTEM.md` gives to
the controller alone — and it creates no `workspace/volume-12-*` directory and writes no `outline/volume-12.md`.** The
one thing it may create after the close record is written is **exactly one** next-phase prompt,
`workspace/volume-12-planning/PROMPT.md`, for `outline/volume-12.md`, *The Road Up*, ch 661–720. **That prompt is
written last, after the close record exists, and there is nothing after it.**

**The authority for this phase is `outline/volume-11.md`.** Read it whole before reading anything else.
`outline/series.md` §9 fixes the volume's title, its range and its goal and none of the three is re-planned here.
**`outline/ending.md` is read for continuity only, nothing in it may be moved, and Volume 11 must be audited as having
not spent it.**

## Where the page stands, from the page and not from a plan

**`state/current.md` §*Who is where at end of ch 660 — VOLUME 11 CLOSED ON THE PAGE* is the live position and it is
binding.** `state/continuity.md` §*VOLUME 11 BATCH 0004 — ch 646–660* carries the batch's established facts, its
measured construction budget and its hard canon, and the block beneath it carries **the volume as a whole with the
discrepancies this batch found and did not repair.** **A fifth block follows them: §*VOLUME 11 BATCH 0004 — REVIEW
REPAIR*, which records nine page repairs, four corrected word figures, two false claims struck out of this prompt, one
prompt error, and six findings deliberately left unrepaired.** `state/open-threads.md` §*Volume 11 Batch 0004* carries
the thread table Volume 12 inherits. **Read those five blocks before reading a chapter.**

### The figures, and the five that must be re-measured rather than carried

Batch 0004 measured by `grep -v '^#' <file> | wc -w`, chapter by chapter and over the fifteen together, and published
in `state/continuity.md`: **1,841 · 1,954 · 1,807 · 1,853 · 1,821 · 1,839 · 2,368 · 2,300 · 1,925 · 1,955 · 2,051 ·
2,028 · 1,964 · 1,924 · 2,116 = 29,746, average 1,983.** The four batches as published sum to **118,744 over sixty,
average 1,979.** **Five things in or around that set are known to be wrong, incomplete or method-dependent, and this
close must re-measure rather than carry any of them.** Four per-chapter figures were mis-transcribed into the first
published set and have been corrected in place by the Batch 0004 review repair; the close re-measures them rather than
trusting either version:

1. **Batch 0001 is recorded at 28,446 words in `state/current.md`, `state/continuity.md` and `state/chapter-summaries.md`,
   and ch 601–615 re-measure at 29,284** under the same method that reproduces Batch 0002's 29,748 and Batch 0003's
   29,966 exactly. **That is a recorded figure that does not reproduce, in a closed phase, and the close must publish one
   true volume figure measured across all sixty files and correct the three state files that carry 28,446.**
2. **The three Severance days and their intervals must be re-derived, not carried: 1,842 · 1,917 · 1,997, at intervals
   of 70 · 75 · 80, and 155 from the seventh to the ninth.** Check every written interval on the page, check every
   month-day under `((day − 134) mod 30) + 1` with the command named in the record, and check the going-lighter figure
   `D − 1,560` wherever it is stated.
3. **The bracket count must be exactly three in sixty, at ch 616, ch 632 and ch 648, and six bracket characters in the
   whole volume.** Measured by grep it is three. **Count it yourself and publish the command.**
4. **THE MEASUREMENT METHOD ITSELF HAS A TRAP, and it is the reason two of the craft lines below disagree with a
   casual count.** **Thirty-nine of the sixty files have no trailing newline.** A chapter's last body line is therefore
   glued to the next file's `# ` title, `grep -v '^#'` no longer removes it, and the title is counted. Measured
   per file, `nothing` is **209** across ch 601–660; measured as `cat chapters/volume-11/*.md | grep -v '^#'`, it is
   **211**, the extra two being ch 649's *The Sky Says Nothing Back* and ch 660's *A Board With Nothing Written On It*.
   **The close must pick one method, state it, and publish it**, and must say which of the two numbers it is quoting.
5. **THE CLOSING INTERVAL WAS WRONG BY A FACTOR OF EIGHTEEN AND IS NOW REPAIRED.** ch 660's last speech said *the last
   of the ceiling went into the ground on the fourth of this month **two years ago***. The fourth of the month beginning
   1,994 is **day 1,997**; ch 660's closing speech is the seventh of the month beginning 2,054, **day 2,060**. That is
   **sixty-three days**. The page now says *sixty-three days ago in front of thirteen people*, and the count of
   thirteen is the furnace-ground headcount that ch 620, 626, 631, 637, 645, 647, 650, 657 and 658 all use.

### Two craft lines this batch found already over their targets, in closed phases

Measured across ch 601–660 by `grep` on word boundaries in body prose, in the same batch that drafted ch 646–660 and
**re-measured after the Batch 0004 review repair: `nobody` 34 against the outline's under-thirty line · `eleven` 43
against the under-forty line · `thank` 16**, against Batch 0002's recorded 0 for `thank` across ch 616–630 and Batch
0003's measured 0 across ch 631–645 — so the sixteen are all in Batch 0001 or Batch 0002. **`forgiv` 0 · `week` 0 ·
`about` 356, average 5.9, under its line · `whole of` 73, under 80 · `nothing` 209, average 3.5 · `out loud` 254,
average 4.2.** **The close must re-measure these and decide, section by section, which are findings to repair on the
page and which are findings to record.** Repairing a batch-1 or batch-2 word is in scope for a close; softening a
sentence to fix a count is not. **`eleven` is 43 and not the 42 the drafting phase recorded: the repair added one,
because the turn-to-wall leg is eleven of made road and that figure had to go onto the page to replace a wrong
thirteen. The close should know the extra one is the repair's and not a fresh drift.**

### A PROMPT ERROR THAT MUST NOT BE REPAIRED ON THE PAGE

**`workspace/volume-11-batch-0004/PROMPT.md:103` says the furnace ground is "154 days east of the turn." The page says
sixty-five.** ch 660:71 reads *at a furnace ground sixty-five days east of here*, and `state/current.md` carries
sixty-five days and counting from the same place. **The 154 is a transcription of `state/current.md`'s own line *"Days
from the turn (day 1,842) is 154"*, which is a different quantity — the days elapsed since Severance 7, not a
distance.** **The close must record the conflict and leave both figures standing. It must not reconcile the page to
the prompt here.**

## What this phase must audit

Walk `outline/volume-11.md` against the page, one section at a time, and record every item as **held**, **not held**, or
**held differently**. Do not repair in the middle of the walk. **Write the whole audit, then repair.**

1. **The volume goal, from `outline/series.md` §9:** *Ning Yan must learn what Yuan was before he died, or the ending is
   being decided blind.* **Check the actual ending shape against it and report honestly.** She asked at ch 609, took the
   answer across four mouths and a fifth at ch 652–654 in a dead clerk's fair hand, read it alone at ch 656 and read it
   aloud in daylight at ch 657, and stayed at ch 658. **That is the goal discharged, and the close should say so with the
   page quoted.**
2. **The three stages and their pinned days.** Severance 7 at ch 616 / day 1,842 · Severance 8 at ch 632 / day 1,917 ·
   **Severance 9 at ch 648 / day 1,997.** Intervals **70 · 75 · 80**. Re-derive every month-day and check the written
   intervals. **Note the forced overlap recorded in `state/continuity.md`: ch 646 and ch 647 share day 1,997 with the
   stage chapter at ch 648, in the way ch 629 and ch 630 shared the thirteenth in Batch 0002, and the page holds.**
3. **The three costs, each named once and never re-derived.** *She cannot hear what she is told about him, and it runs
   both ways* (ch 616) · *she cannot keep him by asking* (ch 632) · **she cannot go back to not knowing** (ch 648).
   **Grep for re-derivations across all sixty chapters and count them.** Chapter 656 shows the first cost at its
   maximum pressure — he says it to her and it does not arrive, and she works out that a page in another person's hand
   does — and that is a showing and not a re-derivation; the close should say which it is and why.
4. **The bracket budget, honestly.** Three in sixty, and the thinned silence after the ninth named once in her own
   thought at ch 649 and not explained. Verify by grep and record.
5. **The five origin mouths, and the fifth one.** ch 608 · ch 622 · ch 636 · ch 640 · **652–654**. **The fifth is the
   only one written on the page and it is Feng's fair hand.** Check that no two mouths restate one another, that the
   surface answer is not re-voiced in any of them, that no chapter put her inside the harvest, and that no page of the
   widow's book or the harvest book is read out loud by anybody. **Count `Scribe` across the volume on word boundaries:
   Batch 0003 spent the one naming at ch 644 and Batch 0004 spent 0, so the volume must carry exactly one.**
6. **The frame scenes.** **Exactly seven in the manuscript, at ch 272, 338, 401, 458, 518, 584 and 644, and none after
   644.** Verify by grep that there is no eighth anywhere in Volume 11 and that every sentence he speaks is in the
   present tense and that no other character is ever in a marked present frame.
7. **The irreversible steps.** The volume's are ch 609 (the asking) · ch 624 (`YUAN SHENG` written) · ch 645 (the tax
   named as designed and she stays) · **ch 653 (the instrument taken and spent) · ch 655 (he dies, ordinary) · ch 658
   (she stays knowing and it cannot be un-stayed).** Verify each on the page and report whether each is irreversible in
   fact and not only in the card.
8. **The map.** The turn, the post nine miles west of it, the mill five miles west, the lane four miles west, the store
   behind the mill fourteen miles from the post, the wall thirteen miles east of the turn with eleven of made road and
   two past it, **nothing between the gate and the wall to lie down on**, no shed at the turn, the barrow ground on the
   rising ground east of the flat, the furnace ground east of that, and **Lowwater west of everything**. **Batch 0004 put
   the barrow ground at thirteen miles east of the turn and the turn thirteen miles west of Lowwater** — check both against
   the twice-listed map and report. **Four further map findings are on the page as it stands and the close must
   adjudicate them, not assume them away:**
   - **The furnace ground's distance from the turn is stated two ways and they are sixty-five and 154.** The prompt
     error is flagged above; the page says sixty-five and the page is the authority. Record and leave standing.
   - **There are two walls, or one wall in two places.** ch 649:121 puts *the wall with the opening standing open in it,
     four feet and a bit* two miles east of the furnace ground and two miles of wet ground between the gate and it, and
     ch 660:7 puts a wall with an opening four feet and a bit thirteen miles east of the turn, **on a leg the furnace
     ground is not on at all.** The map has one wall. Check both sentences against `outline/volume-11.md` and report
     which is the stray. **The Batch 0004 review did not repair this, because doing so means choosing between two
     load-bearing descriptions and moving geography, and that is a close's call and not a drafting phase's.**
   - **THE SURFACE OF THE LAST TWO MILES IS ALSO IN CONFLICT, AND IT IS THE VOLUME 10 CLOSE'S OWN SPINE ON THE OTHER
     SIDE.** ch 541, as settled by the Volume 10 close and restated at ch 558, reads *nine miles of strip road between
     this post and a turn, and eleven miles of made road between that turn and the wall, and then **the last two miles
     of flat ground***, and the Volume 10 close record says that spine is *stated twenty-four times to the made leg and
     never contradicted*. **Batch 0004 calls the gate-to-wall leg *two miles of wet ground with a rut in it*, at ch
     649:121 and at ch 660:5.** Both cannot be the spine. **Adjudicate.** The repair left the wet-ground image
     standing — it is consistent across the batch twice and was not a review finding — and cut the one line in ch 660
     that happened to agree with the spine (*two miles of flat with a fence on the north side*, old line 7) only
     because it described the gate-to-wall leg a second time. **The fence and the stones stayed; the two-mile figure
     went with them.**
   - **The Batch 0004 review repaired the made-road figure and the walk's total.** ch 659:119 read *thirteen miles of
     made road* and now reads **eleven**, which is the map's figure for the gate-to-turn leg, and ch 660 read *she
     walked the thirteen miles* and now reads **seventeen**, because ch 659:5 puts the rows *another four past the wall*
     and the wall thirteen miles east of the turn. ch 660:5 now gives the breakdown — four off the rows, two of wet
     ground, the rest made road from the gate — and the competing *two miles of flat* in the next paragraph was cut
     because it described the same leg a second way.
9. **The named cast.** **`Ning Wu` ONCE, at ch 659, and not twice.** The first version of this item said *twice, at ch
   605 and ch 659*; that is wrong and the close must not record it as verified. **`grep -oiw "Ning Wu"` on ch 601–660
   returns exactly 1, at ch 659.** ch 605 carries only `Ning Yan`. The Hunter once in this batch at ch 650 and never
   named on the page (`Hunter` returns 0 across the volume) · Wei Ran twice, ch 607 and ch 651 · **Shuyin once, ch 659,
   not named and not thanked — and he is NOT greppable by name, so a name-count for him cannot succeed and must not be
   attempted: `Shuyin` returns 0 across ch 601–660 and returns 0 across the whole batch, by design, because he is
   written as *The Old Man On The Road* in a `## ` heading at ch 659 and as a man of nine hundred in the body.**
   **Verify him by grepping the section heading `The Old Man On The Road` and the body phrase `a man of nine hundred`,
   and record the named/unnamed distinction explicitly instead of a name count.** **Feng Lushi at ch 652–656, the only
   name this batch spends** (`Feng` 9 and `Feng Lushi` 2 across ch 646–660, all at ch 652–655). Verify each count by
   grep and report.
10. **The hard prohibitions, one at a time, each with a grep and a verdict:** `Ledger · reconciled · plate · licence ·
    clearance · countersignature · seal · kiln-born · MEMBER ABSENT · tribulation · Anchor · Sisterhood · bargain ·
    vouch · field agent · Wall writ · Warden · Hunter · Shuyin` all 0 in body prose · **no harem, nothing a romance, and
    her mother's name never said** · **the year of non-forgiveness not mentioned once** · **no person thanked anywhere**
    · **no figure of what is left of him on any page** · **the lever — asking twice — not pulled anywhere in the volume**
    · **the terms unmoved: one at a time, in daylight, standing** · **the window a hundred yards off the east side, the
    lime off the bar at ch 604 and the hut light all still unspent** · ***twenty-two days* still unplaced and equated to
    no dated interval anywhere in the volume.**
11. **`outline/ending.md` §8 and its five obligations.** Check that Volume 11 has **not** previewed the Anchor, release,
    the Sisterhood or the bargain, that nobody has explained why a bounded world needs readers, that **Feng's fair
    handwriting is on the page once and read once**, and that the moral answer is unpaid.

## Six findings the Batch 0004 review opened and did NOT repair

The Batch 0004 review repair closed nine defects on the page and **declined six others on purpose.** They are recorded
here so the close inherits them as live findings rather than re-deriving them, and so none of them is mistaken for
clean prose. **All six are in the Batch 0004 drafting phase's own chapters and none is a plot error.**

1. **ch 650's span does not match its own lighter figures, and two chapters inherit the error.** ch 650 uses relative
   days — *the second*, *the sixth day*, *the seventh day* — and its two going-lighter figures resolve under `D −
   1,560` to **day 2,019 and day 2,020**, so ch 650 runs day 2,014 to 2,020 against the card's 2,011–2,018. But ch
   650:153 names *the seventh day of the month beginning 1,994*, which is **day 2,000** and names neither; and ch
   651:111 dates the Hunter's scene to *the ninth hour of the seventh of the month beginning 1,994* — **day 2,000**
   again, and at the wrong hour, since ch 650:33 puts him at the **seventh** hour. ch 651:113 and 651:115 then both
   say **That was two days ago** about a scene six days back. **No day was moved, because moving one is a close's
   call.** Adjudicate: either ch 650's relative days are pinned to the card and its lighter figures corrected, or the
   card is wrong and the relative days are read against day 2,014.
2. **ch 649:63 says *I said one thing in a yard two days ago* on the sixteenth, and the yard was the third** —
   thirteen days. **It was not repaired, because the sentence's argument is *I am not doing it twice in seven days*,
   and no earlier yard statement she made sits inside seven days of the sixteenth. Repairing the interval means
   rewriting the logic of the line, which is a scene rewrite and not a defect repair.**
3. **Two walls.** Covered in item 8 above.
4. **Eight duplicate `## ` section headings are inherited from Batches 0001–0003 and stand inside Volume 11 today:**
   *the asking* (609, 624) · *what came out of the ground* (611, 637) · *what she is left holding* (611, 621) · *why*
   (613, 621) · *nineteen* (615, 627) · *the sixth hour* (616, 624) · *what she is left with* (624, 633) · *nineteen
   years* (628, 642). **Batch 0004's own sixty-odd headings are unique within the batch and against all of Volume 11,
   and the one it renamed at the repair — *the sentence she said in a yard yesterday*, ch 647 — is unique
   book-wide.** These eight are in closed phases and a drafting phase may not reopen them. **The close may repair a
   batch-1 or batch-2 word, and the same authority covers a heading: rename them or record them.**
5. **The batch's risk profile is exertion, not danger, and that is as the cards were written.** The pinned physical
   risk is real and costs her — seventeen miles in the dark at ch 659–660 on an arm open four days in five, four hours
   of sleep on stones by a trough, two coppers she cannot count — **but there is no pursuit, no injury and no hard
   deadline anywhere in the fifteen chapters.** Consistent with the cards; **record it in the close record rather than
   repair it**, and do not manufacture a threat to fix it.
6. **ch 654's internal clock names one scene three different days, and the chapter is the climax.** He writes the last
   of it at the **sixth hour of the sixteenth** of the month beginning 2,024 (day 2,039, twice: line 3 and line 27);
   he says the first sentence to an empty room **"on the second afternoon"** (line 9) which is day 2,040 — the day
   *after* he wrote them; and line 11 dates the same empty-room scene to **the thirteenth** of the month beginning
   2,024, **day 2,036**, which is ch 653's span. Line 23's *"this morning I am going to be the first person in ten years
   who proves it"* points the same way as line 11 and against line 9. **Not repaired: choosing between them means
   choosing what caused the fifth origin mouth to be written down, and that is the volume's climax.** Adjudicate, and
   if the page is wrong, repair the two or three lines and say which reading you took.

## What this phase must not do

- **Do not write new chapter prose.** The close audits, records and repairs. If it finds a defect it repairs that defect
  and nothing else, and it does not rewrite a scene.
- **Do not repair by softening.** A finding is recorded and the page is left carrying it where the sentence is true.
- **Do not move a day, a stage, a bracket, a title, an irreversible step, a mouth or the ending.** Report a conflict
  between the outline and the page; do not silently reconcile it.
- **Do not write `outline/volume-12.md`.** The next phase after this one is Volume 12 planning and it writes that file.
- **Do not preview `outline/ending.md`.** Volume 11 must be audited as having **not** spent it.
- **Do not introduce a new final enemy.** Shuyin was walked past, survived and not thanked.
- **Do not claim a count you have not run.** Every number in the close record is measured before it is written down, and
  the command that produced it is named where a later phase would need to reproduce it.

## What this phase produces

1. **A close record in `state/continuity.md`** under a new heading, walking `outline/volume-11.md` section by section with
   a verdict on each item, **carrying the measured figures and the pre-repair figures separately where they differ**, and
   ending with the volume's true word count, its true construction budget and its per-chapter table rebuilt from the
   files. **The Batch 0001 discrepancy and the two over-target craft lines must be resolved or reported here, explicitly.**
2. **`state/current.md`** corrected in place, with a `## Who is where at end of Volume 11` block a cold reader can start
   from, **and every occurrence of the 28,446 figure corrected to the true one.**
3. **`state/open-threads.md`** — what the close confirms is still open and what Volume 12 inherits, kept compact.
4. **`state/chapter-summaries.md`** — the volume's sixty chapters in one compact pass, if they are not already there.
5. **A repair note**, in the close record, listing every repair made on the page with the file and the finding, and
   stating plainly what was **not** repaired and why.
6. **Then, and only then, exactly one next-phase prompt: `workspace/volume-12-planning/PROMPT.md`**, for
   `outline/volume-12.md`, ***The Road Up*, ch 661–720**, goal fixed by `outline/series.md` §9: *In this volume, Ning Yan
   must ascend at all, or the Chosen One designation is harvested and every sacrifice Yuan has made is spent for
   nothing.* **It must hand Volume 12 its engine out of what Volume 11 resolves — the asking, the reading, the writing,
   the staying, the forty-one strokes and the road up — and must not put the ascent on Volume 11's page, must not spend
   the Sisterhood and must not preview anything else the ending owns.**
7. **Nothing else.** No second prompt. No `.done` marker. No `workspace/volume-12-batch-0001/` and no Batch 0001 prompt
   for Volume 12.