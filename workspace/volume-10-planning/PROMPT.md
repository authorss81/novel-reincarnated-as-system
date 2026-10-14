# Volume 10 planning — ch 539–600 — PROMPT

## What this phase is

**Volume 9, *The Warden*, ch 479–538, is closed, audited and repaired on the page.** All four batches are written. The
Volume 9 close audited all sixty chapters against `outline/volume-09.md`, recorded **twenty-six findings and repaired
none of them**, walked the required-continuity list one item at a time, and corrected four of its own figures without
writing prose. **The close was then reviewed — `logs/volume-09-close.review.log` — and its findings were cleared on the
page by a repair pass: eleven word-count claims in nine chapters, four calendar and staging defects, sixteen
authorial-scaffolding lines across fourteen files, five retired tokens, one distance, and fifty-eight trailing newlines.
Twenty-nine chapter files were opened and twenty-eight of them edited. Nothing was rewritten and no beat, day anchor, title, stage, bracket, structural
mouth, irreversible decision or planned event moved.**

**Current Volume 9 figures: 113,811 words of body prose over sixty chapters, average ~1,897**, on the method the close
settles — **body prose is every line not beginning `#`, so the `#` chapter title line and every `##` section heading are
excluded.** By batch **27,729 · 28,509 · 28,572 · 29,001**. *(The close measured 113,790 — 27,725 · 28,532 · 28,572 ·
28,961 — and the +21 is accounted for word by word at `state/continuity.md` §*Volume 9 close — REVIEW REPAIR*: ch 536's
*The Two Days After* is thirty words longer because it now says where she was and that she did not know, and ch 512's
interval is six words longer because it no longer carries a retired figure.)* 538 `#` headings manuscript-wide, zero
collisions, longest Volume 9 title 30 characters. **Three bracketed layer lines in sixty, at ch 493, ch 508 and ch 523,
and Volume 9's budget is spent. Volume 10 opens on no bracket unless this outline sets a new and stated one.**

**This phase writes two files: `outline/volume-10.md` and `workspace/volume-10-batch-0001/PROMPT.md`.** It is the
planning phase for Volume 10, *The List*, ch 539–600. It follows the shape of `outline/volume-09.md` and is held to
`OUTLINE_GUIDE.md` and `AGENTS.md`.

**There is no chapter-writing in this phase and no batch drafting in it.** If you find yourself drafting prose, or
drafting Batch 0001 of Volume 10, you have drifted: stop and record the finding instead. **The two deliverables are the
outline and the first batch's card, and nothing else.** **No second prompt, no second `workspace/volume-1*` directory, and
no `.done` marker, which `PHASE_SYSTEM.md` gives to the controller alone.**

**This prompt exists because the Volume 9 close was forbidden from writing it.** `workspace/volume-09-close/PROMPT.md`
says *It writes no second prompt*, and its review found the consequence: with no Volume 10 prompt on disk, the controller
mints a generic continuation whose whole brief is one line — *plan the next volume and write its first 10 to 20 chapter
batch* — which merges Volume 10's planning with its Batch 0001 drafting in one call. **`PHASE_SYSTEM.md` §*One Phase,
One Job* names that as the most common cause of a phase that returns nothing. Every earlier close in this run wrote its
successor's prompt. This one now has, and it is the only next-phase directory the repair created.**

**Nothing in this phase may edit `outline/series.md`, `outline/ending.md`, `outline/volume-09.md`, `scripts/`,
`.github/workflows/`, `.opencode/agent/`, `AGENTS.md`, `PHASE_SYSTEM.md`, `REPO_PLAN.md`, `OUTLINE_GUIDE.md`,
`opencode.json` or `state/phase-ledger.json`.** `outline/volume-10.md` does not exist and this phase creates it.

## Read before you start

`AGENTS.md`, `NOVEL_SPEC.md`, `OUTLINE_GUIDE.md`, **`outline/series.md` in full**, `outline/ending.md`,
**`state/current.md` — `## Volume 9 close — REVIEW REPAIR` first, then `## Who is where at end of chapter 538`, then
`## Volume 9 close audit — CLOSED`**,
`state/continuity.md` including ***Volume 9 close — REVIEW REPAIR***, ***Volume 9 close — the volume as a whole*** and its
***Construction budget***, `state/open-threads.md` including its **VOLUME 9 CLOSED AND AUDITED** block and its
**VOLUME 9 CLOSE REPAIR** block, `state/chapter-summaries.md` including **VOLUME 9** and the close-repair section,
`state/book-metadata.md`, `state/INDEX.md`, the six `bible/` files,
**`outline/volume-09.md` as the model of what a volume outline is and as the authority on everything Volume 9 settled**,
**chapters 519–538**, and `workspace/volume-09-close/SUMMARY.md`.

**`outline/series.md` §9 is the authority for the volume's title, its chapter range and its one-sentence goal, and none
of the three may be re-planned here.** `scripts/completion_guard.py` holds the range.

## The goal, fixed, not to be re-planned

> In this volume, Ning Yan must find her brother before the Warden's list closes for good, or Ning Wu stays a name on a page for another decade.

**Title: *The List*. Chapters 539–600. Sixty-two chapters.**

**Read that sentence twice, because the second half is the trap and the first half is not.** Volume 10 is not about
whether a list closes. It is about **one name on it** and **the eight years she has wanted a name in a book.** Volume 9
opened the list by being written into it; Volume 10 is about what else is on it and who is not.

## The question Volume 10 opens onto, fixed by `outline/volume-09.md` §*New question for Volume 10*

**Carried verbatim and neither previewed, expanded nor softened:**

> She has been written as lost by the only man in the world who cannot be stopped writing her, and she has written his rule down herself where his hand cannot take it out, and the price of surviving him is that there is now a book under a ladder with her hand in it and a list with her name on it as lost — and at three stages past the ceiling, with no place left that is hers and no road that goes anywhere she has been, she is at last free enough to ask what else is on it. **The question is not whether the list closes. It is what is on it and who is not, and whether a name she has wanted in a book for eight years is one of the ones a man of nine hundred years has been keeping for longer than she has been alive.**

**And the last line of Volume 9, which is ch 538 and which this volume opens on top of — from the page, not from a plan:**

> “I am here,” he said. “Ning Yan.”

**He came twenty-two miles in three days and stood at the foot of a keeper's ladder while she said his name out loud at a
person for the first time in eight years, and he said his own.** **He is on the wrong side of a wall he opened from the
inside at her order, and he stays wrong-sided for the rest of the book.** That is where Volume 10 finds him.

## Where she is at the last page — read off the state files, not re-derived

**Day 1,598, the twenty-fifth of the month beginning 1,574.** Derive under `((day − 134) mod 30) + 1` and do not assert.
She is standing four feet off a ladder at a post on a strip road **nine miles west of a turn**, at the ninth hour, in
daylight, **in front of three people**, with **a bar on her shoulder** and **nine days without bread in the telling
count.**

- **Ning Yan, nineteen, at Severance 3** — three stages past the ceiling of a realm. **She has no wages, no shed, no room
  of her own and a name written in a book nine hundred years old with one word at the end of it that she does not know
  the meaning of.**
- **Body:** right index finger gone, **four fingers and a thumb**; **right arm open four days in five**; short breath
  **four counts everywhere including inside a loaded reach**, about four seconds of it on flat ground and nine inside a
  loaded one; eight of eleven holds; **the small open place low behind her fourth rib, the size of a coin, open since the
  eighteenth of the month beginning 1,274, and it is what the merit comes out of**; **not hungry, and that is finished**.
- **What she is carrying:** a bar · a skin · a bag with a dish and a lump of clay in it and a ring a finger's width ·
  **a sheet of paper against her ribs that she opened with her own two hands four years ago and has never once called
  anything** · **a book the size of a closed hand, eight leaves, a date and a place on the first, four sentences on the
  second, six empty ones that are hers.**
- **What is on a flat stone under the bottom of that ladder, in daylight, in front of three people, with an inch of stone
  between it and the keeper's book: her own eight leaves.** His hand cannot reach it. **She did not ask him to keep it
  and she did not ask the keeper to keep it either.**
- **Nine miles west of the turn is where she is. The turn is a quarter of a mile off a bench on a store road. The far
  ground is twenty-two miles east of the post**, with a wall still open in it, a plank table standing in the opening with
  nothing on it, a door shut on eleven feet of boards, and **a window a hundred yards off with no light in it, dark now
  for the second night — and she is at the post and she did not know that and has not asked.**

## The seventeen continuity facts, as Volume 9 left them

**Walk this list against ch 479–538 before you plan a single card, and record in `outline/volume-10.md` which of them
Volume 10 inherits, which it spends, and which it may only carry.** Full walk at `workspace/volume-09-close/SUMMARY.md`;
the measured state at `state/continuity.md` §*Volume 9 close — the volume as a whole*.

1. **The relicensing legs stay in order** — clearance → seal → countersignature. **Volume 9's allowance for all three was
   0 and the paper was opened without any of them being named.** State Volume 10's own.
2. **MEMBER ABSENT** stands three times, permanent, may only be carried.
3. **The register still reads *reconciled*, and is not read.**
4. **The Clay Plate is worn against her ribs and has still not been described.** It is the object whose texture she
   remembers at ch 1000 and **Volume 16 owns that.** State Volume 10's allowance for `plate`.
5. **What became of the eleven is not raised. The four months erased in Chapter 3 are never named.** The ch 128 silence
   is unbroken. The ch 150 refusal is not softened.
6. **His unentered state and the date of the morning he died are gone, and nothing gives either back.** **Nothing may
   soften the finding that being read means being sent for** — and Volume 9 sharpened it, because it is now on a page in
   nine hundred years of handwriting.
7. **The claim is answered and not reopened. Hou Sanliang is paid and has never been met.** **Ning Bo's account is
   discharged. Ning Wu's decade is a line with no mark on it** — **and Volume 10 is the volume that line is about.**
8. **Ning Wu does not appear on Volume 9's page and no card may put him there.** He may be named in her own want only,
   counted, **and never in Shuyin's mouth and never on a page of the list.** **This volume is where he may begin to
   appear, and the outline must state plainly and early what "appear" costs and what it may not do.**
9. **No harem and nothing in Volume 10 is a romance.** *The shape of a happy life* is spent until Volume 16, by Ning Wu.
   **Ning Yan never says her mother's name.** Yuan does not tell her what he was before he died before Volume 11.
10. **No office above the Standing Office of the Second Account is named.** **Shuyin is a man and not an office; his
    room, his book and his rule are the only things about him that are ever on the page. No department, no floor, no rank
    list, no committee, no house, no title beyond *Warden*.**
11. **The Hunter's request stays pending.** A Wall writ is not issued to a field agent. **He was on Volume 9's page
    exactly twice, at ch 491 and ch 531, and she asked him both times.**
12. ***Kiln-born* stays in two heads and on no paper.**
13. **The Ledger: never ordered, held, priced, refused or thought about in Volumes 6, 7, 8 or 9.** `grep -i Ledger` returns
    **0** across all sixty chapters of Volume 9.
14. **The year of non-forgiveness is still running.** *That is not forgiveness. It is a purchase, and the account is still
    carrying, and it will be carrying at the end of the book.* **Volume 9's allowance was 0 and the close's review repair
    cut the one sentence that broke it at ch 502, without softening anything at ch 466 or ch 474.** **Volume 10 states
    its own allowance and holds it, and a batch reviewer will hold it the same way.**
15. **No figure of what is left of Yuan is stated on any page.** The last figure in the manuscript is *about six weeks* at
    ch 236. **The bill at ch 466 is a figure of a total and not a figure of him.** The number of one at ch 516 is a number
    of who stays wrong-sided and not a figure of him. **Volume 9 added no figure of him and this volume must not either.**
16. **Yuan's readability:** readable from outside the bound without her since ch 272 and therefore findable; addressed as
    a holder since ch 338 and therefore sendable; **answerable since ch 401.** Per `outline/series.md` §4 he is **Door**
    across Volumes 9–11. **He opened one wall from the inside at ch 518 and cannot go back through it. The ending still
    needs him findable, and he is.**
17. **What Volume 9 changed, all of it standing:** Severance 1 → 3, three stages past the ceiling · **she cannot keep a
    place by staying in it** · **she cannot be met where she is expected** · **she cannot go back down the road she came**
    · the paper opened alone and never named · **Shuyin named, survived, and writes her in as lost** · **her ch 474
    refusal copied by another hand, and that is the reason the list found her** · he opened a Door from the inside once
    at her order and told her the price of one before spending it · **he spoke to her for the first time in over two
    hundred days at ch 520 and again at ch 538** · the fifth frame scene is on the page at ch 518 · **one man east of the
    turn stays on the wrong side alive, and it is her act and she watched it happen** · **her own book is under a ladder
    nine miles west with her hand in it, and she is standing four feet off it** · **at the last page the walls stay and
    the reason for them is recorded where he cannot reach it.**

**Two facts arrived in Volume 9's last two chapters and this outline must carry them explicitly, because a batch drafter
will not find them on the page unless they are in the cards.** **The word he wrote is *lost*, four letters, four seconds,
and nobody in the world — including the man who wrote it — will say what it does; and it is now on a list with her name
on it, which is a different thing from a book she made.** **And she left a hut's light standing unremarked on the night
of the twenty-third and does not know it went out.**

## The protagonist, and the standing requirement to answer him in writing

**`outline/series.md` §2 makes Yuan, male, the protagonist of this novel, and every volume from Volume 5 on has carried
`## The protagonist, answered in writing` in its close audit. Volume 9's is at `state/current.md`. Write Volume 10's
outline so that a drafting phase can answer it in the same register, and state what Volume 10 is doing to him that
Volume 9 was not.**

**What Volume 9 costs him that is not a state he had before.** Volume 7 made him a thing that can be quoted. Volume 8
made him pay for it. **Volume 9 made him wrong-sided and permanent.** He opened a wall from the inside at her order and
stepped through it, and the cost of the Door stage is *every wall he opens leaves someone permanently on the wrong side* —
**and the person left on the wrong side is himself, and it was her order, and he did it anyway, and he is correct about
everything.** He said *I am here* on the last page, which is the first sentence he has given her that is not an answer
to something else.

**A planning phase that reads Volume 10 as a volume about a list has planned the wrong volume. It is a volume about a man
who can be found, who said his own name at a ladder, and who cannot get back through a door he opened for her.**

## The antagonist, and the single most important thing this plan may not get wrong

**`outline/series.md` §6 gives Shuyin exactly one Volume 10 line, and `outline/ending.md` §1 fixes what this volume may
and may not spend of him. Read both and hold them.**

**THE WARDEN IS A MAN WITH A LIST AND A RULE AND A BODY NINE HUNDRED YEARS OLD. A PLAN THAT TURNS THE LIST INTO A BUILDING
IS A PLAN THAT HAS BEGUN INVENTING FURNITURE.** Volume 9 found the shape of this book's institutions — one room, one
book, one rate, one rule, one lamp — **and a list is not a corridor.** He does not have a hall, a rank list, a wing, a
committee, a uniform, or a hierarchy of subordinates with titles.

**Some of the names on his list are his friends, and he will not pretend otherwise.** He buys nothing, threatens nothing,
and is not a liar. **He is not the final enemy and must not be built as one — `outline/ending.md` fixes Shuyin released
the Anchor list in Volume 10 and alive, old, and not thanked.** **He is already on Volume 10's page: he stood at the foot
of the keeper's ladder at ch 538. He survived Volume 9, he is old, and she has not thanked him.**

## What Volume 10 must not do

- **Must not preview `outline/ending.md` beyond the line `outline/series.md` and `outline/volume-09.md` already give.**
  In particular: **do not put the Anchor on a page, do not show what release looks like, do not touch the Sisterhood, do
  not put the bargain on the table, and do not let the Warden explain why a bounded world needs readers.**
- **Must not re-voice the ch 267 surface answer in any mouth, in any form, anywhere.** Volume 9's measured evidence that
  it holds: `charged` 0 · `bookkeeping` 0 · `receipt` 0 · `bounded world` 0 · `the walls` 0.
- **Must not introduce a new final enemy.** The Scribe belongs to Volume 15 and `outline/ending.md` fixes it there.
- **Must not read a page of his book out loud.** That was Volume 9's hard rule and it holds into this volume, which is
  the volume most tempted by it. **A plan that gets the list's contents by having somebody read it aloud has found a
  shortcut that the book has refused four volumes.**
- **Must not turn any office or person into a villain, including the Warden.** The Order's answer to a refusal is
  silence, not persecution.
- **Must not spend anything `outline/ending.md` §1 owns** beyond the one line already given. **Do not require Shuyin's
  survival or his old age to be paid for, and do not write a scene in which he is thanked.**
- **Must not re-derive Volume 11's material.** Check `outline/series.md` §9 for what it owns and leave it alone.
- **Must not resolve the *Twenty-two days* line, which Volume 9 plants at a jamb at ch 536 and never explains.** It is
  live, unplaced and unanswered. **A card may put it in front of her again and a card may not answer it** unless Volume
  10's own cards earn it, and **the outline must say in one line what it is for, so that a batch drafter cannot invent an
  answer by accident.**
- **Must not move anything `outline/series.md` §4 puts in another volume, and must not leave a gap for a drafting phase
  to invent.**

## Power progression

**Severance 1–9 run across Volumes 9–11 and Volume 9 spent Severance 1, 2 and 3 at days 1,412, 1,488 and 1,561 —
intervals of 121, 76 and 73, first to third 149, ceiling to close 270.** Volume 10 begins at **Severance 3 and day
1,598**, and **you set Volume 10's own stage count, its days and its intervals in `outline/volume-10.md`, derived under
`((day − 134) mod 30) + 1` and not slid to fit a chapter number.** State each stage's cost in the series' own shape:
Severance *gives her that she no longer needs a place to stand; it costs her that she stops being able to go home.*

**Volume 9 named its three costs once each and never re-derived them: she cannot keep a place by staying in it · she
cannot be met where she is expected · she cannot go back down the road she came.** Volume 10's costs must be the same
kind of thing — a rule she now lives under, not a wound she takes again — and **no card may re-derive a Volume 9 cost.**

## What this outline must contain

`outline/volume-09.md` is the model. In order, and with the method stated inside the file so every later figure inherits
it: **Goal** · **Fixed and not to be re-planned** · **Central pressure** · **Where she is at the last page** · **What the
volume must not be** · **The protagonist** · **The three structural facts this volume inherits, and must not re-derive** ·
**Starting state, with the day derived** · **Starting relationships** · **Starting power level** · **Major locations** ·
**Major factions** · **Power progression with the bracket budget stated honestly** · **The structural answer — where it
continues, in whose mouths, and how many** · **Pressure rotation** · **The escalation sequence** · **The midpoint** ·
**Shuyin in Volume 10** · **The Hunter in Volume 10** · **Wei Ran, with Volume 10's own allowance** · **Volume climax** ·
**Concrete resolution** · **Final chapter image** · **New question for Volume 11** · **Required continuity facts to
preserve after the volume** · **Hard rules for the drafters, restated once** · **The construction budget, every figure an
allowance to be checked by grep and not a promise** · **The batch plan, with goal, midpoint, climax and irreversible step
per batch** · **Per-batch word targets** · **Word-count and calendar methods.**

## Carry-forward: two defects in `outline/volume-09.md` that no phase may edit

**Record both in `outline/volume-10.md` under a heading that names them, and carry or forgive them here. Do not go and
edit Volume 9's file.**

1. **F1 — the Wei Ran allowance is exceeded by one card.** `outline/volume-09.md` allows *at most two cards in Volume 9,
   one in Batch 0002 and one in Batch 0004*. **She is on the page in three chapters — ch 497, ch 505 and ch 527, twenty-two
   occurrences on word boundaries** — so Batch 0002 carries one card more than the allowance. Nothing else about her
   moved: a trade, a team, a rate, an opinion, eight coppers unchased, no gift, no scene, nothing a romance. **Volume 10
   must state its own Wei Ran allowance with Volume 9's real figure of three chapters in the same sentence, and must not
   pretend Volume 9 spent two.**
2. **F2 — one structural mouth is off its length.** `outline/volume-09.md` pins *four or five short sentences each*
   across five mouths and **ch 484's mouth delivers nine.** Four of five hold; the fifth did not, and the repair order
   forbade touching a structural mouth, so it stands. **Volume 10 should either set a range wide enough to survive a
   mouth that overruns or say in one line that a mouth that overruns is a finding to record and not a defect to fix
   mid-draft.**

**And one figure that was measured and reported rather than promised away, which Volume 10 inherits as a live number:
`whole of` is 193 in Volume 9 against a manuscript target under 80, and bare `eleven` is 218 against a target under 200.
Volume 9 brought `about` down to 422, an average of 7.0 a chapter, exactly at the line. State Volume 10's own figures and
targets and measure them before claiming them.**

## Deliverables

1. **`outline/volume-10.md`** — the volume outline, in the shape above, holding every fixed item and re-deriving nothing
   that `outline/series.md`, `outline/ending.md` or `outline/volume-09.md` already fixes.
2. **`workspace/volume-10-batch-0001/PROMPT.md`** — the card the first drafting phase runs against: ch 539 onward, its
   days, its pressure, its goal, midpoint, escalation, climax and irreversible step, every pinned continuity fact it may
   not break, and its construction budget with the method inside the sentence with the number.
3. **State updates, appended in place:** `state/current.md` (a Volume 10 planning block, and *Chapter written* and *Next
   phase* corrected in place with a note saying so) · `state/continuity.md` (the volume's planning decisions and the
   two Volume 9 defects carried or forgiven) · `state/open-threads.md` (what Volume 9 hands Volume 10, in one paragraph,
   including the *Twenty-two days* plant) · `state/chapter-summaries.md` (a Volume 10 planning line).
4. **No chapter prose, no second prompt, no controller edits, no `.done` marker.**

## The one thing this phase will be tempted to do

**It will be tempted to resolve *Twenty-two days*, to put Ning Wu on a page in the first chapter, and to open Shuyin's
book.** All three are forbidden, and the third has been forbidden by the same rule for four volumes. **Write the outline
so that the engine of Volume 10 is a woman standing four feet off a ladder with eight leaves in a stone and a name on a
list that says she is lost** — and if a card cannot be written from that, the card is wrong and not the position.
