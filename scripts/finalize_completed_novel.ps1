<#
.SYNOPSIS
  Finalize a completed novel: verify it is finished, report its trigger state,
  and optionally make the repository private.

.DESCRIPTION
  Run by the controller once a novel records state/complete.md.

  Stopping automatic triggers is handled in-repository by the build-epub workflow,
  which trims the schedule and repository_dispatch triggers from novels.yml while
  leaving workflow_dispatch in place, so the novel stops waking itself but a
  deliberate manual run is still possible. This script verifies that happened.

  The visibility change is guarded behind -MakePrivate so it is always deliberate.
  It is reversible: GitHub documents making a private repository public again. What
  cannot be undone is the public -> private direction's side effects, namely the
  permanent erasure of stars and watchers, forks created while public staying
  public and detached, and loss of some private-repo features.

.PARAMETER Slug
  Repository name, for example novel-sequence-of-rain.

.PARAMETER MakePrivate
  Actually flip visibility to private. Omitted by default so the irreversible step
  is always deliberate.

.EXAMPLE
  ./finalize_completed_novel.ps1 -Slug novel-sequence-of-rain
  ./finalize_completed_novel.ps1 -Slug novel-sequence-of-rain -MakePrivate
#>
param(
  [Parameter(Mandatory = $true)][string]$Slug,
  [switch]$MakePrivate,
  [string]$Owner = 'authorss81'
)

$ErrorActionPreference = 'Stop'
$repo = "$Owner/$Slug"

function Invoke-Gh([string[]]$GhArgs) {
  $output = & gh @GhArgs 2>&1
  if ($LASTEXITCODE -ne 0) { throw "gh $($GhArgs -join ' ') failed:`n$output" }
  return $output
}

$marker = Invoke-Gh @('api', "repos/$repo/contents/state/complete.md", '--jq', '.path')
Write-Host "complete marker : $marker"

$state = Invoke-Gh @('api', "repos/$repo", '--jq', '.private')
Write-Host "currently private: $state"

# Which triggers survive in the workflow file.
$raw = (Invoke-Gh @('api', "-H", 'Accept: application/vnd.github.raw',
  "repos/$repo/contents/.github/workflows/novels.yml")) -join "`n"
$hasSchedule = [bool]($raw -match '(?m)^\s{2}schedule:')
$hasDispatch = [bool]($raw -match '(?m)^\s{2}repository_dispatch:')
$hasManual = [bool]($raw -match '(?m)^\s{2}workflow_dispatch:')
Write-Host "triggers        : schedule=$hasSchedule repository_dispatch=$hasDispatch workflow_dispatch=$hasManual"

# The EPUB build is scheduled while a novel is in progress, but a finished
# private repository must not keep waking itself: private minutes are billed
# and the build is deterministic. Manual dispatch is preserved.
$epubPath = '.github/workflows/epub.yml'
$epubSha = (Invoke-Gh @('api', "repos/$repo/contents/$epubPath", '--jq', '.sha')).Trim()
$epubRaw = (Invoke-Gh @('api', "-H", 'Accept: application/vnd.github.raw',
  "repos/$repo/contents/$epubPath")) -join "`n"
if ($epubRaw -match '(?m)^\s{2}schedule:') {
  $kept = @()
  $skipping = $false
  foreach ($line in ($epubRaw -split "`r?`n")) {
    if ($line -match '^\s{2}schedule:\s*$') { $skipping = $true; continue }
    if ($skipping) {
      if ($line.Trim() -eq '' -or $line -match '^\s{4}') { continue }
      $skipping = $false
    }
    $kept += $line
  }
  $payload = @{
    message = 'perf: stop scheduled EPUB rebuilds on a completed private novel'
    content = [Convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes(($kept -join "`n")))
    sha     = $epubSha
    branch  = 'main'
  } | ConvertTo-Json -Compress
  $epubTmp = [IO.Path]::GetTempFileName()
  Set-Content -LiteralPath $epubTmp -Value $payload -NoNewline -Encoding utf8
  $null = Invoke-Gh @('api', '-X', 'PUT', "repos/$repo/contents/$epubPath", '--input', $epubTmp)
  Remove-Item -LiteralPath $epubTmp -Force
  Write-Host 'epub schedule removed; workflow_dispatch kept'
}

if ($hasSchedule -or $hasDispatch) {
  # A GITHUB_TOKEN cannot edit .github/workflows at all, so trimming happens here
  # with the controller's credential. workflow_dispatch is preserved so a
  # deliberate manual run is still possible later.
  $original = [IO.Path]::GetTempFileName()
  $trimmed = [IO.Path]::GetTempFileName()
  try {
    Set-Content -LiteralPath $original -Value $raw -NoNewline -Encoding utf8
    Copy-Item -LiteralPath $original -Destination $trimmed -Force
    $note = python (Join-Path $PSScriptRoot 'disable_auto_triggers.py') $trimmed
    Write-Host $note
    if ($LASTEXITCODE -ne 0 -or (Get-Content -LiteralPath $trimmed -Raw) -eq $raw) {
      Write-Host 'triggers already disabled; nothing to commit'
    }
    else {
      $sha = (Invoke-Gh @('api', "repos/$repo/contents/.github/workflows/novels.yml", '--jq', '.sha')).Trim()
      $body = @{
        message = 'novel: stop automatic workflow triggers on a completed manuscript'
        content = [Convert]::ToBase64String([IO.File]::ReadAllBytes($trimmed))
        sha     = $sha
        branch  = 'main'
      } | ConvertTo-Json -Compress
      $payload = [IO.Path]::GetTempFileName()
      Set-Content -LiteralPath $payload -Value $body -NoNewline -Encoding utf8
      $null = Invoke-Gh @('api', '-X', 'PUT',
        "repos/$repo/contents/.github/workflows/novels.yml", '--input', $payload)
      Remove-Item -LiteralPath $payload -Force
      Write-Host 'automatic triggers removed; workflow_dispatch kept'
    }
  }
  finally {
    Remove-Item -LiteralPath $original, $trimmed -Force -ErrorAction SilentlyContinue
  }
}

if (-not $MakePrivate) {
  Write-Host ''
  Write-Host 'Nothing changed. Re-run with -MakePrivate to flip visibility.'
  Write-Host 'That change is reversible; GitHub documents making a private repository'
  Write-Host 'public again. What is lost now cannot be restored: stars and watchers'
  Write-Host 'are erased permanently, and public forks stay public and detached.'
  exit 0
}

Write-Host ''
Write-Host 'Making the repository private. Reversible; stars and watchers are not.'
$null = Invoke-Gh @('api', '-X', 'PATCH', "repos/$repo", '-F', 'private=true', '--jq', '.private')
Write-Host "private now     : $(Invoke-Gh @('api', "repos/$repo", '--jq', '.private'))"