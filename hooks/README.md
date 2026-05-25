# Hooks

Two Claude Code hooks used in production on this repo.

---

## token_tracker.ps1

**Event:** `Stop` (fires after every Claude Code session ends)  
**Platform:** Windows / PowerShell 7+  
**What it does:** Reads the session JSONL, sums token usage fields, deduplicates
by `message.id`, and appends one row to a markdown log file.

### Install

1. Copy `token_tracker.ps1` to a permanent location (e.g. `~/.claude/token_tracker.ps1`)
2. Edit the `$log_path` variable near the bottom to point to your preferred log file
3. Add the Stop hook to `~/.claude/settings.json`:

```json
{
  "hooks": {
    "Stop": [
      {
        "matcher": "",
        "hooks": [
          {
            "type": "command",
            "command": "powershell -File C:\\Users\\<you>\\.claude\\token_tracker.ps1"
          }
        ]
      }
    ]
  }
}
```

### Output

One row per session appended to your log:

```markdown
| Date       | Time  | Session  | Input   | Cache-Create | Cache-Read | Output | Total (raw) |
|------------|-------|----------|---------|--------------|------------|--------|-------------|
| 2026-05-18 | 09:14 | a3f8c1b2 | 841200  | 312400       | 26100000   | 95300  | 27349900    |
```

The log is created automatically if it doesn't exist.

### Why this matters

Claude Code session data is easier to reason about when it is logged in a simple
format. This hook gives you the raw token fields needed for later analysis.

Provider pricing changes over time. Use the token breakdown with current
provider pricing if you need a cost estimate.

Real data from this repo: [`research/001-token-economics.md`](../research/001-token-economics.md)

---

## pre-commit (secret scanner)

**Event:** Pre-commit git hook  
**Platform:** Any POSIX shell (bash/sh)  
**What it does:** Scans every staged file for credential patterns before allowing a commit.
Blocks commits containing API keys, private-key headers, or hardcoded secrets.

Patterns checked:
- `sk-` (OpenAI), `sk-ant-` (Anthropic)
- `AIza` (Google), `AKIA` (AWS)
- private-key file headers
- `api_key`, `token`, `secret` assignments with 16+ char values
- `ANTHROPIC_API_KEY`, `OPENAI_API_KEY`, `GITHUB_TOKEN` set to non-variable values

### Install

```sh
# From repo root
cp hooks/pre-commit .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit
```

Or copy to any repo's `.git/hooks/` directory.

> The hook blocks `git commit`. It does **not** block `git commit --no-verify`.
> Don't use `--no-verify`. That's the whole point.
