# Revised Phase and Workflow Design

## Repository Model

Use one public repository per novel. Do not modify the existing `llops-android` repository.

Each repository is independent and receives its own model API key. The repositories may run in parallel because their files, branches, state, and credentials are separate.

## Repository Layout

```text
AGENTS.md
NOVEL_SPEC.md
opencode.json
.github/workflows/novels.yml
scripts/novel_runner.sh
.opencode/agent/novel-writer.md
.opencode/agent/novel-reviewer.md
bible/
  premise.md
  world.md
  characters.md
  power-system.md
  themes.md
  terminology.md
outline/
  series.md
  ending.md
  volume-01.md
  volume-02.md
  volume-03.md
  batches/
    volume-01-batch-0001.md
    volume-01-batch-0002.md
chapters/
  volume-01/
    chapter-0001.md
    chapter-0002.md
state/
  current.md
  continuity.md
  open-threads.md
  chapter-summaries.md
  phase-ledger.json
reviews/
  volume-01/
    batch-0001.md
logs/
prompts/
  batch-writer.md
  reviewer.md
  volume-auditor.md
```

## Outline System

Every novel begins with a full planning stack before prose is generated.

### Series outline

The series outline defines:

- The premise and central promise.
- The protagonist's want, need, flaw, and final change.
- The world, power rules, magic limits, technology, and societies.
- The long mystery and its final answer.
- The main antagonist ladder.
- The planned ending and final volume.
- Major relationship milestones.
- The difference between this novel and every other fleet novel.

### Volume outlines

Each volume's chapter count is set by that novel's arc; it is not a fixed band and
is not uniform across the fleet. A volume outline defines:

- Its single-sentence goal and what is lost if it fails.
- Its central pressure.
- Its beginning state.
- Its major factions and locations.
- Its escalation steps.
- Its midpoint reversal.
- Its climax.
- The emotional and strategic resolution.
- The new question that motivates the next volume.
- Any planned power or relationship progression.

### Batch outlines

A batch holds the chapters that make up one dramatic unit. Its size follows the
arc rather than a fixed count, subject to the one reliability constraint above: a
single model call must be able to finish it well.

Every batch outline defines:

- Batch goal.
- Starting condition.
- Chapter-by-chapter cards.
- Mid-batch turn.
- Batch climax.
- Character and power changes.
- New open questions.
- Required continuity updates.
- Expected batch word range only as a flexible guide.

A chapter card contains:

```text
Chapter number
POV and location
Immediate goal
Resistance
Major turn
Emotional or practical consequence
Required continuity facts
Ending hook or completed beat
```

## Batch Phase Model

A phase processes 10–20 chapters in one model run. The model is loaded once per phase instead of once per chapter.

### Bootstrap phases

- `phase-000-bootstrap`: create the novel specification and bible.
- `phase-001-series-outline`: create the complete series arc and ending.
- `phase-002-volume-01-outline`: create the first volume and its batches.
- `phase-003-buffer-plan`: create detailed cards for the first 10–20 chapters.

### Batch phases

Each phase writes a complete batch:

```text
workspace/volume-01/batch-0001
workspace/volume-01/batch-0002
workspace/volume-01/batch-0003
```

The writer reads:

- `NOVEL_SPEC.md`
- the series ending outline
- the current volume outline
- the current batch outline
- the previous batch summary
- the previous two or three chapters for immediate voice and continuity
- `state/current.md`
- `state/continuity.md`
- `state/open-threads.md`
- relevant character and world files

The writer does not need to read every previous chapter. The state and previous batch summaries are the long-term memory. Read the previous 20 chapters for immediate voice and continuity; extend to 30 when the model’s verified context budget safely allows it. After a batch finishes, the writer creates exactly one next-phase prompt: either the next batch or the volume-close phase. This makes self-dispatch continue without pre-creating hundreds of phase files.

The writer must write 10–20 complete chapters in order, with full scenes and natural prose. It updates the chapter summaries, continuity, and open-thread files as it works.

If the model output limit is reached, the phase must stop at a chapter boundary, commit the completed chapters and state, mark the remaining batch as resumable, and continue in the next run. It must never restart completed chapters.

### Batch audit

After every batch:

- Validate all expected chapter files exist.
- Check approximate length without padding.
- Detect duplicate paragraphs and exact repeated sentences.
- Check that each chapter changed the situation.
- Check the batch's planned midpoint and climax occurred.
- Check that no chapter introduced an unapproved canon change.
- Review prose quality and continuity.
- Apply necessary fixes.
- Update the phase ledger and batch summary.

### Volume audit

At the end of every volume:

- Review the entire volume outline against the produced summaries.
- Check unresolved promises and mysteries.
- Check character relationships and consequences.
- Check power progression and costs.
- Check world-building consistency.
- Check the planned volume climax and resolution.
- Create or activate the next volume outline only after the audit passes.

A volume audit is a separate phase. It must not attempt to rewrite the entire volume.

## Self-Dispatch

After a successful batch phase, the workflow sends at most one new `repository_dispatch` event for the same novel.

The selector chooses one explicit next batch by reading `state/phase-ledger.json`, not by scanning hundreds of marker files.

A phase is identified by:

```text
volume
batch
start chapter
end chapter
status
attempt count
lease expiry
base commit
result commit
actual model
fallback used
next retry time
```

A phase is one of:

```text
planned
running
deferred
done
blocked
```

Only the controller may mark a phase done or blocked. Duplicate events must be harmless. A run must claim a phase before writing files and must verify the phase is still incomplete.

A rate-limited phase writes `deferred` and exits quickly. A scheduled safety-net run retries it later. A real failure retries a limited number of times and then writes `blocked` plus an issue.

## Workflow Jobs

The default workflow uses one main worker job so uncommitted files do not need to move between isolated GitHub runners.

### `select-and-claim`

- Reads the phase ledger.
- Claims the lowest incomplete batch.
- Records the base commit and lease expiry.
- Uses a fixed per-novel concurrency group.

### `write-validate-review-fix`

In the same job:

1. Check out the claimed commit.
2. Run the writer agent.
3. Validate chapter count, prose markers, and state changes.
4. Run the read-only reviewer.
5. Run the fixer agent if findings exist.
6. Revalidate.
7. Commit chapter, outline, state, review, and ledger files together.
8. Push to the novel branch.
9. Emit one next-phase dispatch.

Keeping these steps in one job avoids the separate-runner workspace problem.

### `commit-and-dispatch`

If branch protection is enabled, push a batch branch and open a pull request. Do not dispatch the next batch until the branch is merged or the controller explicitly records the batch as the active source.

For a dedicated public novel repository with a bot owner, direct commits to the chosen writing branch are acceptable after the pilot is approved.

## Concurrency

Each repository uses an immutable group:

```yaml
concurrency:
  group: novel-${{ github.repository }}-writer
  cancel-in-progress: false
```

This prevents two writers from changing the same novel. Different repositories have different concurrency groups and may run simultaneously.

Twenty repositories are supported by the architecture. Because each repository has a separate API key, model quotas are less likely to be shared. Account-wide GitHub limits and provider-wide limits still apply.

Start with a five-repository pilot. Expand to all twenty after checking job duration, model failures, and review quality.

## Model Configuration

The primary model requested is:

```text
opencode/space-bunny-free
```

The following free models were confirmed locally with:

```text
opencode models
```

Confirmed free models relevant to the fallback chain:

```text
opencode/space-bunny-free
opencode/muse-spark-1.3-contributor-free
opencode/muse-spark-1.2-contributor-free
opencode/nemotron-3-ultra-free
opencode/nemotron-3.5-lightning-free
opencode/mimo-v2.6-flash-free
opencode/ling-3.0-flash-fin-free
```

The production workflow will run the same command before generation and record the result. If the primary is unavailable, it reports that fact clearly before using a fallback.

Fallback is allowed only for model unavailability, rate limits, timeouts, or provider errors. A real writing or continuity failure is never hidden by switching models.

Use:

```text
NOVEL_MODEL=opencode/space-bunny-free
NOVEL_FALLBACK_MODELS=opencode/muse-spark-1.3-contributor-free,opencode/muse-spark-1.2-contributor-free,opencode/nemotron-3-ultra-free,opencode/nemotron-3.5-lightning-free,opencode/mimo-v2.6-flash-free,opencode/ling-3.0-flash-fin-free
```

## Chapter Length

Chapter length is **not a hard limit and not a per-chapter quota.** It varies with
the novel, the volume, and the shape of the individual scene.

As a pacing guide, most webnovel chapters land around **1,800–2,700 words**. A
scene carrying a confrontation, a journey, a revelation, or an emotional payoff
may run longer; a sharp turn or reversal often lands better short. The test is
whether the chapter keeps doing dramatic work, and whether the rhythm suits a web
serial read on a phone.

Never pad to reach a length and never split a complete scene to shorten one.

A long book also needs more turns per volume, not merely shorter chapters. That is
handled by volume sizing and the volume goal, not by a per-chapter word ceiling.

## Batch Sizing

Chapters per batch are chosen to fit the dramatic unit, not to hit a fixed count.
The one firm consideration is reliability: **a phase must be a unit that a single
model call can finish well.** Phases that ask one call to cover a whole volume's
close duties reliably return nothing and block the repository. That is a technical
constraint on the call, not a creative limit on the chapter count.

## Volume Sizing and Arc

Chapters per volume are set by that novel's arc and are not uniform across the
fleet. A book whose movements are broad may run fewer, longer volumes; a book
built on escalation may run more, tighter ones. What must hold is that each volume
reads as a complete movement.

Every volume outline must contain, as its first structural statement:

> In this volume, **<lead> must <goal>**, or **<named thing> is lost**.

A volume must open its own pressure, carry a midpoint reversal, pay off its own
promise at a climax, and resolve the emotional and practical consequence before
the next volume's question is raised. A volume is not a chunk of a long narrative;
it is a story.

## Opening Gate

The first batch of every novel is checked against a hard gate before it is
accepted:

- Chapter 1 states the lead's concrete objective, an anomaly, and a consequence
  within roughly the first 800 words.
- The central mechanic **and its cost** are demonstrated by an event by the end of
  Chapter 3, not by exposition.
- Every chapter ends on a question, danger, revelation, decision, reversal,
  emotional consequence, or unanswered mystery.
- Chapters run only as long as the scene keeps doing dramatic work, and paragraphs
  stay short enough to read on a phone. Neither is a numeric quota.

A first batch that fails the gate is repaired before the series continues. A novel
that opens well and then drifts back into documentary density will lose the
readers it earned, so the same checks apply to every volume's first batch.

## Chapter Length and Batching (superseded guidance)

Earlier drafts allowed 2,200–3,200 words and 10–20 chapter batches. Both figures
are retired in favour of the targets above.

## Chapter Format

A chapter file contains the title as its first-level heading, plain paragraphs, further headings for
sections inside the chapter, bold or italic emphasis where stress genuinely falls, and any system
messages inside square brackets on their own line.

```text
# Chapter 1 - The Plate That Would Not Read

The lamp over the second bench had been failing since March, and Tomas had been meaning to replace
the bracket for a week.

[FURNACE HEAT: 34. Intent unresolved.]
```

Blockquotes, code blocks, tables and horizontal rules do not belong in chapter prose: markup that
survives conversion to a serial reader or an EPUB appears as literal characters. Bold, italic and
section headings are allowed, but sparingly, and emphasis that the sentence could carry on its own
should be left to the sentence.

## One Phase, One Job

A phase does one job. That part is a hard rule.

A planning phase never writes prose, and a writing phase never plans a volume. Combining them in one call is
the most common cause of a phase that returns nothing, because planning and prose compete for the same
response budget.

**How many phases a job takes is not a fixed number.** It follows how much work the turn actually needs and
whether previous attempts succeeded. Do not impose a phase count in advance: early volumes and small batches
need less, later volumes need more, and a plan that assumes one size fails on the other.

### The volume turn

At minimum two phases:

1. **Volume planning** — the volume outline, its batch cards, and the next phase prompt for the first batch.
   No chapter prose.
2. **First batch** — the chapters, in their own phase.

If the planning turn is too large to do well, split it again: movements in one phase, batch cards in the
next. Judge it empirically. A phase that exits without writing anything has asked for more than one call
can deliver, so narrow it and continue rather than retrying it unchanged.

### The volume close

At minimum two phases:

1. **Close audit** — what the volume promised, what it paid, and what is still open.
2. **Close record** — write the resolution into the state files and create the next volume's planning phase.

A long volume may be audited in halves rather than in one pass.

### Later volumes need lighter phases, not fewer

Later volumes accumulate locks, calendars, continuity and cross-references, so an identical phase
description costs more to read and more to answer. From roughly the third volume onward, prefer more phases
of smaller scope, and prefer auditing a volume in halves. A phase should never grow larger as the novel
advances.

## State Growth

Never load the whole manuscript into every batch prompt. Keep summaries compact and bounded.

At the end of every batch:

- Store a batch summary.
- Keep a rolling window of 20–30 recent chapters for immediate voice reference.
- Update continuity and open threads.
- Keep a rolling volume summary.
- Archive older chapter summaries by volume without deleting them.

If the continuity files grow too large, create a volume-level index and retrieve only relevant sections.

## Security

Each public repository receives its own secret:

```text
OPENCODE_API_KEY
```

Use a separate key per repository. Never commit keys, print them, or send them to generated text.

Use least privilege, pinned actions, protected branches, and a dedicated bot identity. Do not use secrets-bearing workflows on untrusted pull requests.

## Approval Gates

Before any repository is created or pushed, review:

- `AGENTS.md`
- `RESEARCH.md`
- `NOVEL_CATALOG.md`
- `PHASE_SYSTEM.md`
- `REPO_PLAN.md`
- Primary and fallback model chain
- Public versus private draft policy
- Direct branch versus pull-request policy
- First five-repository pilot
