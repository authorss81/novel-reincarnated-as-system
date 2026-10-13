#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"
git config user.name "novel-fleet-bot"
git config user.email "novel-fleet-bot@users.noreply.github.com"
mkdir -p logs

PRIMARY="${NOVEL_MODEL:-opencode/space-bunny-free}"
FALLBACKS="${NOVEL_FALLBACK_MODELS:-opencode/muse-spark-1.3-contributor-free,opencode/muse-spark-1.2-contributor-free,opencode/nemotron-3-ultra-free,opencode/nemotron-3.5-lightning-free,opencode/mimo-v2.6-flash-free,opencode/ling-3.0-flash-fin-free}"
MAX_MODELS="${MAX_MODELS:-3}"
PLANNING_TIMEOUT_SECONDS="${PLANNING_TIMEOUT_SECONDS:-2700}"
BATCH_TIMEOUT_SECONDS="${BATCH_TIMEOUT_SECONDS:-7200}"
REVIEW_TIMEOUT_SECONDS="${REVIEW_TIMEOUT_SECONDS:-900}"
FIX_TIMEOUT_SECONDS="${FIX_TIMEOUT_SECONDS:-3600}"
CHECKPOINT_INTERVAL_SECONDS="${CHECKPOINT_INTERVAL_SECONDS:-300}"
MAX_ATTEMPTS="${MAX_ATTEMPTS:-6}"
RETRY_DELAY_SECONDS="${RETRY_DELAY_SECONDS:-900}"

if [ -z "${OPENCODE_API_KEY:-}" ]; then
  echo "OPENCODE_API_KEY is missing" >&2
  exit 2
fi

phase_dir=""

# A phase whose own prompt declares the manuscript finished is a declaration,
# not a writing task. Calling a model for it is pointless: the model correctly
# writes nothing, which looks identical to a failure and burns every attempt
# until the phase blocks. Recognize it before any model runs.
declare_completion_from_prompt() {
  local candidate="$1" chapter_count
  [ -f "$candidate/.done" ] && return 1
  # The plan decides whether a book is over, not the writer. A phase that reaches
  # the end of a volume has no way to tell "this volume" from "this book", and one
  # closed a planned 500-chapter novel at chapter 50.
  if ! python3 scripts/completion_guard.py . >/dev/null 2>&1; then
    echo "Completion refused by the series plan:"
    python3 scripts/completion_guard.py . 2>&1 | sed 's/^/  /'
    return 1
  fi
  # A postface phase always talks about the finished manuscript, because that is
  # what it is for. Treating it as a declaration marks the novel complete before
  # the synopsis exists, so postface work is never eligible here.
  case "$candidate" in
    workspace/postface*|workspace/synopsis*|workspace/epub*) return 1 ;;
  esac
  # Merely stating that the manuscript is finished is not enough: the synopsis
  # phase opens with exactly that sentence and still has real work to do. Require
  # an instruction to declare completion and to write nothing.
  grep -qiE 'this phase (verifies|records|declares)|the runner recognises the declaration|declare (the )?completion|write nothing' "$candidate/PROMPT.md" || return 1
  grep -qiE 'manuscript (is|has) (finished|complete)|novel is (finished|complete)|book is (finished|complete)' "$candidate/PROMPT.md" || return 1
  mkdir -p state
  chapter_count="$(find chapters workspace -name 'chapter-*.md' -type f 2>/dev/null | wc -l | tr -d ' ')"
  {
    echo "# Novel complete"
    echo
    echo "- final phase: $(basename "$candidate")"
    echo "- chapters: $chapter_count"
    echo "- recorded: $(date -u +%Y-%m-%dT%H:%M:%SZ)"
  } > state/complete.md
  touch "$candidate/.done"
  rm -f "$candidate/.blocked" "$candidate/.attempts" "$candidate/.deferred" \
        "$candidate/.retry-after" "$candidate/.checkpoint" "$candidate/.wip-conflict"
  git add -A
  if git commit -m "novel: complete $(basename "$candidate") (manuscript finished)" >/dev/null; then
    git push origin HEAD || echo "warning: could not push completion marker" >&2
  fi
  echo "Phase $(basename "$candidate") declared the manuscript finished; recorded completion"
  return 0
}

# Cleanup pass over every phase prompt, run before selection and without an early
# exit. A volume outline phase whose outline file already exists has no work
# left, so the writer correctly changes nothing; without this the phase burns
# its attempts on empty runs and then blocks itself. Selection cannot do this
# because it stops at the first eligible phase, and an obsolete phase often
# sorts after the phase that is actually pending.
retire_obsolete_phases() {
  local changed=false prompt_file candidate first_line_lc outline_vol rescued
  # Recover first: a blocked phase that asks one call to write a whole batch
  # never writes anything, so rescope it instead of stalling the repository.
  rescued="$(python3 scripts/rescue_overscoped.py . 2>/dev/null || true)"
  if [ -n "$rescued" ]; then
    echo "$rescued"
    changed=true
  fi

  # A finished manuscript needs no further prose. Any phase still pending after
  # completion is by definition optional: another batch, a continuation, a repair.
  # Leaving them pending resumes the book after the ending, so all are retired and
  # only the closing/postface machinery is allowed to run.
  if [ -f state/complete.md ]; then
    while IFS= read -r candidate_dir; do
      [ -n "$candidate_dir" ] || continue
      [ -f "$candidate_dir/.retired" ] && continue
      [ -f "$candidate_dir/.done" ] && continue
      case "$candidate_dir" in
        workspace/closing*|workspace/postface*|workspace/synopsis*|workspace/epub*)
          continue
          ;;
      esac
      echo "Retiring $candidate_dir: novel already complete"
      touch "$candidate_dir/.retired"
      rm -f "$candidate_dir/.deferred" "$candidate_dir/.retry-after" \
        "$candidate_dir/.attempts" "$candidate_dir/.blocked"
      changed=true
    done < <(find workspace -name PROMPT.md -type f 2>/dev/null | xargs -r -n1 dirname 2>/dev/null | sort -u)
  fi
  while IFS= read -r prompt_file; do
    candidate="$(dirname "$prompt_file")"
    if [ -f "$candidate/.retired" ] || [ -f "$candidate/.done" ]; then
      continue
    fi
    # Anchored on a punctuation mark, so ordinary prose that happens to contain
    # the word cannot retire a phase. A loose 'Retired ... phase' match once
    # retired a closing phase that merely said so in a sentence.
    if grep -qiE '^retired[.:]' "$prompt_file"; then
      echo "Retiring $candidate: prompt is marked retired"
      touch "$candidate/.retired"
      changed=true
      continue
    fi
    # The "no chapters written" guard keeps writer and close phases out.
    first_line_lc="$(head -n 1 "$prompt_file" | tr '[:upper:]' '[:lower:]')"
    if [[ "$first_line_lc" =~ volume[[:space:]]+([0-9]+).*outline.*phase ]]; then
      outline_vol="${BASH_REMATCH[1]}"
      if [ -f "outline/volume-${outline_vol}.md" ] && ! find "$candidate" -name 'chapter-*.md' -print -quit | grep -q .; then
        echo "Retiring $candidate: outline/volume-${outline_vol}.md already exists"
        touch "$candidate/.retired"
        rm -f "$candidate/.deferred" "$candidate/.retry-after" "$candidate/.attempts"
        changed=true
      fi
    fi
  done < <(find workspace -name PROMPT.md -type f | sort)
  if [ "$changed" = true ]; then
    git add workspace
    if git commit -m "novel: retire obsolete planning phases" >/dev/null; then
      git push origin HEAD || echo "warning: could not push retirement markers" >&2
    fi
  fi
  return 0
}

enforce_completion_plan() {
  # The model can write state/complete.md itself, and it has done so. Anything that
  # trusts the file without checking the plan will build an EPUB and finish a novel
  # at 50 of 500 chapters. Reject the claim and retire the phase that made it.
  [ -f state/complete.md ] || return 0
  if python3 scripts/completion_guard.py . >/dev/null 2>&1; then
    return 0
  fi
  echo "Rejecting a completion the series plan does not support:"
  python3 scripts/completion_guard.py . 2>&1 | sed 's/^/  /'
  mkdir -p reviews
  mv state/complete.md "reviews/rejected-complete-$(date -u +%Y%m%dT%H%M%SZ).md" || return 0
  for d in workspace/postface/synopsis workspace/closing; do
    if [ -d "$d" ] && [ ! -f "$d/.done" ]; then
      touch "$d/.retired"
    fi
  done
  git add -A
  if git commit -m "novel: reject premature completion, manuscript is short of the plan" >/dev/null; then
    git push origin HEAD || echo "warning: could not push the completion rejection" >&2
  fi
  # Always succeed. This runs as a top-level statement under `set -e`, so any
  # non-zero status here kills the run before a single chapter can be written.
  return 0
}

retire_obsolete_phases

enforce_completion_plan

while IFS= read -r prompt_file; do
  candidate="$(dirname "$prompt_file")"
  if [ -f "$candidate/.retired" ]; then
    continue
  fi
  if [ -f "$candidate/.retry-after" ] && [ "$(cat "$candidate/.retry-after")" -gt "$(date +%s)" ]; then
    continue
  fi
  if [ ! -f "$candidate/.done" ] && [ ! -f "$candidate/.blocked" ]; then
    phase_dir="$candidate"
    break
  fi
done < <(find workspace -name PROMPT.md -type f | sort)

if [ -z "$phase_dir" ]; then
  echo "No incomplete phase found"
  exit 0
fi

phase_id="$(basename "$phase_dir")"
prompt_file="$phase_dir/PROMPT.md"
log_file="logs/${phase_id}.log"
review_log="logs/${phase_id}.review.log"
fix_log="logs/${phase_id}.fix.log"
wip_branch="novel-wip/${phase_id}"
checkpoint_pid=""
resumed_work=false

case "$phase_id" in
  phase-000-*|phase-001-*|phase-002-*) phase_timeout="$PLANNING_TIMEOUT_SECONDS" ;;
  *) phase_timeout="$BATCH_TIMEOUT_SECONDS" ;;
esac

printf '%s\n' "Running $phase_id with timeout ${phase_timeout}s" | tee "$log_file"

start_checkpoint_loop() {
  checkpoint_loop &
  checkpoint_pid=$!
}

stop_checkpoint_loop() {
  if [ -n "$checkpoint_pid" ]; then
    kill "$checkpoint_pid" 2>/dev/null || true
    wait "$checkpoint_pid" 2>/dev/null || true
    checkpoint_pid=""
  fi
}

checkpoint_wip() {
  if ! git status --porcelain 2>/dev/null | grep -vE '^\?\? logs/|^.. logs/' | grep -q .; then
    return 0
  fi
  git add -A 2>/dev/null || true
  local tree commit base
  tree="$(git write-tree 2>/dev/null)" || return 0
  base="$(git rev-parse HEAD 2>/dev/null || echo HEAD)"
  commit="$(git commit-tree "$tree" -p "$base" -m "novel: checkpoint $phase_id $(date -u +%s)" 2>/dev/null)" || return 0
  if git push origin "$commit:refs/heads/$wip_branch" --force 2>/dev/null; then
    echo "Checkpoint pushed to $wip_branch"
  fi
  git reset -q 2>/dev/null || true
}

checkpoint_loop() {
  while true; do
    sleep "$CHECKPOINT_INTERVAL_SECONDS"
    checkpoint_wip || true
  done
}

resume_wip() {
  if [ -f "$phase_dir/.wip-conflict" ]; then
    echo "Skipping stale WIP branch $wip_branch after a previous merge conflict"
    return 0
  fi
  if git ls-remote --exit-code origin "refs/heads/$wip_branch" >/dev/null 2>&1; then
    echo "Resuming checkpoint from $wip_branch"
    git fetch origin "$wip_branch" 2>/dev/null || true
    if ! git merge --no-edit FETCH_HEAD; then
      git merge --abort 2>/dev/null || true
      touch "$phase_dir/.wip-conflict"
      git add -f "$phase_dir/.wip-conflict"
      git commit -m "novel: skip stale WIP $phase_id" >/dev/null
      git push origin HEAD || echo "warning: could not push WIP-conflict marker" >&2
      echo "WIP conflict; continuing from current main"
      return 0
    fi
    if ! git diff --quiet origin/main..HEAD; then
      resumed_work=true
    fi
    touch "$phase_dir/.checkpoint"
    rm -f "$phase_dir/.deferred" "$phase_dir/.retry-after"
  fi
}

clear_wip() {
  git push origin --delete "$wip_branch" 2>/dev/null || true
  rm -f "$phase_dir/.checkpoint"
}

restore_controller_files() {
  git restore --source=HEAD -- \
    scripts/novel_runner.sh \
    scripts/install_opencode.sh \
    scripts/build_epub.py \
    scripts/rescue_overscoped.py \
    .github/workflows/novels.yml \
    .opencode/agent/novel-writer.md \
    .opencode/agent/novel-reviewer.md \
    AGENTS.md PHASE_SYSTEM.md REPO_PLAN.md OUTLINE_GUIDE.md opencode.json 2>/dev/null || true
}

commit_changes() {
  local message="$1"
  git config user.name "novel-fleet-bot"
  git config user.email "novel-fleet-bot@users.noreply.github.com"
  restore_controller_files
  git add -A
  if git diff --cached --quiet; then
    return 1
  fi
  git commit -m "$message"
  git push origin HEAD
  return 0
}

defer_phase_with_backoff() {
  local reason="$1"
  local attempts=0
  local retry_at
  stop_checkpoint_loop
  if [ -f "$phase_dir/.attempts" ]; then
    attempts="$(cat "$phase_dir/.attempts")"
  fi
  attempts=$((attempts + 1))
  printf '%s' "$attempts" > "$phase_dir/.attempts"
  if [ "$attempts" -ge "$MAX_ATTEMPTS" ]; then
    # Before blocking, try rescoping in place. A phase that is simply too large
    # for one model call can be narrowed and retried, and a blocked phase is a
    # dead end: nothing dispatches a run to heal it later.
    if [ ! -f "$phase_dir/.retired" ] && python3 scripts/rescue_overscoped.py . 2>/dev/null | grep -q .; then
      rm -f "$phase_dir/.blocked"
      printf '0' > "$phase_dir/.attempts"
      commit_changes "novel: rescope and retry $phase_id" || true
      retry_at=$(( $(date +%s) + RETRY_DELAY_SECONDS ))
      printf '%s' "$retry_at" > "$phase_dir/.retry-after"
      touch "$phase_dir/.deferred"
      commit_changes "novel: defer $phase_id after rescoping" || true
      echo "Phase $phase_id was rescoped instead of blocked; deferred until $retry_at"
      exit 0
    fi
    touch "$phase_dir/.blocked"
    rm -f "$phase_dir/.deferred" "$phase_dir/.retry-after"
    commit_changes "novel: block $phase_id" || true
    echo "Phase blocked after $attempts attempts: $phase_id ($reason)"
    exit 1
  fi
  retry_at=$(( $(date +%s) + RETRY_DELAY_SECONDS ))
  printf '%s' "$retry_at" > "$phase_dir/.retry-after"
  touch "$phase_dir/.deferred"
  commit_changes "novel: defer $phase_id" || true
  echo "Phase deferred until $retry_at: $phase_id ($reason)"
  exit 0
}

checkpoint_and_defer() {
  local reason="$1"
  stop_checkpoint_loop
  checkpoint_wip
  defer_phase_with_backoff "$reason"
}

# A phase that declares the manuscript finished and then changes nothing is a
# completed novel, not a failure. Record it as done and stop the pipeline for
# this repository instead of retrying until it blocks.
# Back off without counting an attempt. Used when the failure is infrastructure
# rather than the phase: rate limits, provider outages, all models unavailable.
# Counting those against MAX_ATTEMPTS blocks a phase that was never at fault.
defer_without_penalty() {
  local reason="$1" retry_at
  stop_checkpoint_loop
  retry_at=$(( $(date +%s) + RETRY_DELAY_SECONDS ))
  printf '0' > "$phase_dir/.attempts"
  rm -f "$phase_dir/.blocked"
  printf '%s' "$retry_at" > "$phase_dir/.retry-after"
  touch "$phase_dir/.deferred"
  commit_changes "novel: back off $phase_id ($reason)" || true
  echo "Phase $phase_id deferred until $retry_at ($reason; attempt budget untouched)"
  exit 0
}

complete_phase_if_declared() {
  # Merely mentioning that the manuscript is finished is not a declaration. A
  # volume-close prompt said "the manuscript as planned is finished" and this
  # function closed a 500-chapter novel at 100 chapters on the strength of that
  # one sentence. Require an instruction to record completion, and require the
  # series plan to agree.
  grep -qiE 'this phase (verifies|records|declares)|declare (the )?completion|record the completion|write nothing' "$prompt_file" || return 1
  if ! python3 scripts/completion_guard.py . >/dev/null 2>&1; then
    echo "Phase $phase_id mentions a finished manuscript but the series plan disagrees:"
    python3 scripts/completion_guard.py . 2>&1 | sed 's/^/  /'
    return 1
  fi
  echo "Phase $phase_id declares the manuscript finished; closing the repository"
  mkdir -p state
  {
    echo "# Novel complete"
    echo
    echo "- chapters: $(find chapters -name 'chapter-*.md' -type f | wc -l | tr -d ' ')"
    echo "- final phase: $phase_id"
    echo "- recorded: $(date -u +%Y-%m-%dT%H:%M:%SZ)"
  } > state/complete.md
  touch "$phase_dir/.done"
  rm -f "$phase_dir/.deferred" "$phase_dir/.blocked" "$phase_dir/.attempts" "$phase_dir/.retry-after" "$phase_dir/.checkpoint" "$phase_dir/.wip-conflict" "$phase_dir/.fix-failed"
  commit_changes "novel: complete $phase_id (manuscript finished)" || true
  clear_wip || true
  return 0
}

has_other_incomplete_phase() {
  local candidate
  while IFS= read -r prompt_file; do
    candidate="$(dirname "$prompt_file")"
    if [ "$candidate" != "$phase_dir" ] && [ ! -f "$candidate/.retired" ] && [ ! -f "$candidate/.done" ] && [ ! -f "$candidate/.blocked" ] && { [ ! -f "$candidate/.retry-after" ] || [ "$(cat "$candidate/.retry-after")" -le "$(date +%s)" ]; }; then
      return 0
    fi
  done < <(find workspace -name PROMPT.md -type f | sort)
  return 1
}

next_continuation_dir() {
  local candidate="workspace/continuation/next"
  if [ -f "$candidate/.done" ] || [ -f "$candidate/.blocked" ]; then
    local n=1
    while :; do
      candidate="$(printf 'workspace/continuation/next-%04d' "$n")"
      [ -e "$candidate" ] || break
      n=$((n + 1))
    done
  fi
  printf '%s\n' "$candidate"
}

ensure_next_phase() {
  if has_other_incomplete_phase; then
    return 0
  fi
  # A finished manuscript gets no further chapter phases. The workflow's seed
  # step owns the one post-completion phase, the synopsis.
  if [ -f state/complete.md ]; then
    return 0
  fi
  local continuation_dir
  continuation_dir="$(next_continuation_dir)"
  mkdir -p "$continuation_dir"
  cat > "$continuation_dir/PROMPT.md" <<EOF
Continue the novel after the completed phase $phase_id. This phase does ONE job.

Read NOVEL_SPEC.md, the series outline and ending, the relevant volume outline, state/current.md, the rolling
summaries, and the previous 20 chapters before doing anything.

If the current volume is NOT complete, write the next planned batch and nothing else.

If the current volume IS complete, this phase is a VOLUME-PLANNING phase and it writes only:
  - the volume outline for the next volume, and
  - its batch cards, and
  - exactly one next phase prompt, which is that volume's FIRST BATCH.
It must NOT write any chapter prose in this phase. The first batch is a separate run.

If that planning turn is itself too large to do well, split it further across another run: plan the
movements in one phase and the batch cards in the next. Judge it by whether the work actually got
written, not by an estimate. A phase that returns without writing anything has asked for more than one
call can deliver, so narrow it and continue rather than retrying it unchanged.

Update manuscript state files, create exactly one next phase prompt, and do not edit controller, workflow,
agent, or dispatcher files.
EOF
}

model_list=("$PRIMARY")
IFS=',' read -r -a fallback_list <<< "$FALLBACKS"
for model in "${fallback_list[@]}"; do
  [ -n "$model" ] && model_list+=("$model")
done
if [ "${#model_list[@]}" -gt "$MAX_MODELS" ]; then
  model_list=("${model_list[@]:0:$MAX_MODELS}")
fi

if declare_completion_from_prompt "$phase_dir"; then
  exit 0
fi

resume_wip
prompt_text="$(cat "$prompt_file")"
if [ -f "$phase_dir/.checkpoint" ]; then
  prompt_text="A checkpoint exists for this phase. Continue from the existing files and state. Do not restart completed work. $prompt_text"
fi

start_checkpoint_loop
writer_ok=false
attempted=0
for model in "${model_list[@]}"; do
  attempted=$((attempted + 1))
  printf 'Trying writer model %s\n' "$model" | tee -a "$log_file"
  set +e
  timeout --signal=TERM --kill-after=30s "$phase_timeout" opencode run --model "$model" --agent novel-writer "$prompt_text" >>"$log_file" 2>&1
  code=$?
  set -e
  if [ "$code" -eq 0 ]; then
    # A model can exit cleanly having written nothing at all. Treating that as
    # success skips the fallback models entirely and burns a retry on an empty
    # result, which is how a phase could fail six times on the same model.
    # Only a clean exit that actually changed something counts as the writer.
    # New chapter files are untracked, so this must see them, not just diffs.
    if [ "$resumed_work" = true ] || git status --porcelain 2>/dev/null | grep -vE '^\?\? logs/|^.. logs/' | grep -q .; then
      printf 'Writer model used: %s\n' "$model" | tee -a "$log_file"
      writer_ok=true
      break
    fi
    printf 'Writer model %s exited cleanly but changed no files; trying the next model\n' "$model" | tee -a "$log_file"
    if [ "$attempted" -ge "$MAX_MODELS" ]; then
      writer_ok=true
      break
    fi
    continue
  fi
  if [ "$code" -eq 124 ] || [ "$code" -eq 143 ]; then
    checkpoint_and_defer "writer timeout"
  fi
  if grep -qiE '429|rate limit|too many requests|quota|timeout|timed out|502|503|504|model not found|unavailable' "$log_file"; then
    printf 'Writer model unavailable or rate limited: %s\n' "$model" | tee -a "$log_file"
    if [ "$attempted" -ge "$MAX_MODELS" ]; then
      # A provider outage is not the phase's fault and must not spend its attempt
      # budget. Six runs of rate limiting used to block a healthy phase forever.
      defer_without_penalty "all writer models unavailable"
    fi
    continue
  fi
  printf 'Writer failed with a work error; not switching models.\n' | tee -a "$log_file"
  stop_checkpoint_loop
  touch "$phase_dir/.blocked"
  exit 1
done
stop_checkpoint_loop

if [ "$writer_ok" != true ]; then
  checkpoint_and_defer "no writer model succeeded"
fi

if ! git diff --quiet; then
  if ! commit_changes "novel: save writer work $phase_id"; then
    if complete_phase_if_declared; then
      exit 0
    fi
    defer_phase_with_backoff "writer produced no file changes"
  fi
else
  if [ "$resumed_work" = true ]; then
    echo "Writer returned no new changes; promoting resumed WIP commit"
    git push origin HEAD:main
  else
    if complete_phase_if_declared; then
      exit 0
    fi
    defer_phase_with_backoff "writer exited successfully but produced no file changes"
  fi
fi

start_checkpoint_loop
set +e
timeout --signal=TERM --kill-after=20s "$REVIEW_TIMEOUT_SECONDS" opencode run --model "$PRIMARY" --agent novel-reviewer "Review the current phase changes. Do not edit files. Return concrete findings and finish promptly." >"$review_log" 2>&1
review_code=$?
set -e
stop_checkpoint_loop

if [ "$review_code" -eq 124 ] || [ "$review_code" -eq 143 ]; then
  echo "Review timed out; writer work is already committed"
  defer_phase_with_backoff "review timed out"
fi
# The reviewer's own words live in a gitignored log, so a bad run is otherwise
# silent in the Actions output. Surface the verdict either way.
echo "Review finished with exit $review_code"

if [ "$review_code" -eq 0 ] && grep -qiE 'finding|problem|issue|contradiction|repetition|outline-like|meta' "$review_log"; then
  start_checkpoint_loop
  set +e
  timeout --signal=TERM --kill-after=20s "$FIX_TIMEOUT_SECONDS" opencode run --model "$PRIMARY" --agent novel-writer "Read the reviewer findings in $review_log. Apply necessary fixes to the current phase and state files. Preserve good prose, do not restart the batch, and do not change the planned plot." >"$fix_log" 2>&1
  fix_code=$?
  set -e
  stop_checkpoint_loop
  if [ "$fix_code" -eq 124 ] || [ "$fix_code" -eq 143 ]; then
    checkpoint_and_defer "fix timeout"
  fi
  if [ "$fix_code" -ne 0 ]; then
    # The writer's chapters are already committed and pushed. A failed quality pass
    # is not a failure of the work, so it must not strand the novel: blocking here
    # stopped a book dead with good prose on disk and no next phase. Record it,
    # complete the phase, and keep going.
    echo "Review fix pass failed with exit $fix_code; recording it and completing the phase"
    printf '%s' "$fix_code" > "$phase_dir/.fix-failed"
    commit_changes "novel: review fix pass failed for $phase_id (exit $fix_code)" || true
  fi
  commit_changes "novel: save review fixes $phase_id" || true
fi

ensure_next_phase
touch "$phase_dir/.done"
rm -f "$phase_dir/.deferred" "$phase_dir/.blocked" "$phase_dir/.checkpoint" "$phase_dir/.wip-conflict" "$phase_dir/.attempts" "$phase_dir/.retry-after"
if ! commit_changes "novel: complete $phase_id"; then
  echo "Completion marker produced no commit"
  exit 0
fi
clear_wip

if [ "${DISABLE_DIRECT_DISPATCH:-0}" != "1" ] && [ -n "${GH_TOKEN:-}" ]; then
  gh api -X POST \
    -H "Accept: application/vnd.github+json" \
    "repos/${GITHUB_REPOSITORY}/dispatches" \
    -f event_type=novel_tick \
    -f "client_payload[phase]=${phase_id}" \
    -f "client_payload[run_id]=${GITHUB_RUN_ID:-local}"
fi

echo "Completed $phase_id"
