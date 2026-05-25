# token_tracker.ps1
# Claude Code stop hook — tracks real token usage per session to a daily markdown log.
#
# Reads the session JSONL transcript, sums all four token types, deduplicates by
# message.id to avoid double-counting, and appends one row to DAILY_TOKENS.md.
#
# INSTALL
# -------
# 1. Copy this file somewhere permanent (e.g. ~/.claude/token_tracker.ps1)
# 2. Add to ~/.claude/settings.json:
#
#    {
#      "hooks": {
#        "Stop": [
#          {
#            "matcher": "",
#            "hooks": [
#              {
#                "type": "command",
#                "command": "powershell -File C:\\Users\\<you>\\.claude\\token_tracker.ps1"
#              }
#            ]
#          }
#        ]
#      }
#    }
#
# 3. Set $log_path below to wherever you want the log written.
#
# OUTPUT FORMAT
# -------------
# | Date | Time | Session | Input | Cache-Create | Cache-Read | Output | Total (raw) |
#
# COST NOTE
# ---------
# Provider pricing changes over time. This hook records token counts only.
# Use current provider pricing separately if you need a cost estimate.

param()

$raw = [Console]::In.ReadToEnd()
if ([string]::IsNullOrWhiteSpace($raw)) { exit 0 }

try { $data = $raw | ConvertFrom-Json -ErrorAction Stop } catch { exit 0 }

$transcript_path = $data.transcript_path
$session_id      = $data.session_id

if (-not $transcript_path -or -not (Test-Path $transcript_path)) { exit 0 }

# ── Aggregate tokens ─────────────────────────────────────────────────────────
$input_tok  = 0
$output_tok = 0
$cache_cr   = 0
$cache_rd   = 0
$seen       = @{}

Get-Content $transcript_path -Encoding UTF8 | ForEach-Object {
    try {
        $line = $_ | ConvertFrom-Json -ErrorAction Stop
        if ($line.type -eq 'assistant' -and
            $null -ne $line.message -and
            $null -ne $line.message.id -and
            $null -ne $line.message.usage) {
            $mid = $line.message.id
            if (-not $seen.ContainsKey($mid)) {
                $seen[$mid] = $true
                $u = $line.message.usage
                $input_tok  += [int]($u.input_tokens                  ?? 0)
                $output_tok += [int]($u.output_tokens                 ?? 0)
                $cache_cr   += [int]($u.cache_creation_input_tokens   ?? 0)
                $cache_rd   += [int]($u.cache_read_input_tokens       ?? 0)
            }
        }
    } catch {}
}

# ── Write log row ─────────────────────────────────────────────────────────────
$total    = $input_tok + $output_tok + $cache_cr + $cache_rd
$date     = Get-Date -Format "yyyy-MM-dd"
$time     = Get-Date -Format "HH:mm"
$short_id = if ($session_id.Length -ge 8) { $session_id.Substring(0, 8) } else { $session_id }

# ← Change this path to wherever you want your log
$log_path = "$env:USERPROFILE\DAILY_TOKENS.md"

$row = "| $date | $time | $short_id | $input_tok | $cache_cr | $cache_rd | $output_tok | $total |"

if (-not (Test-Path $log_path)) {
    $header = @"
# Daily Token Log

Auto-appended on every Claude Code session stop. One row per session.
Deduplicated by message.id — each API call counted once.

| Date | Time | Session | Input | Cache-Create | Cache-Read | Output | Total (raw) |
|------|------|---------|-------|--------------|------------|--------|-------------|
"@
    Set-Content -Path $log_path -Value $header -Encoding UTF8
}

Add-Content -Path $log_path -Value $row -Encoding UTF8
