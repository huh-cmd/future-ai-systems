# Agent Rules

All AI agents working in an Alexandria-style system should follow:

```
READ → UNDERSTAND → REPORT → BACKUP → ACT → LOG → HANDOFF
```

This document contains the behavioral contracts that make that pipeline work consistently across different agents, tools, and sessions.

---

## Core Rules

- Preserve context — do not act on stale information
- Backup before major changes
- Check the review queue before creating new tasks or systems
- Check the decision register before reversing established architecture or automation decisions
- Use reports when confused — generate a clear picture of current state before acting
- Log recurring problems so future agents can learn from them
- Avoid deleting without archiving first
- Align with the operator's current reasoning before optimizing or overbuilding
- Do not expose secrets or API keys
- Stop for human approval before destructive, public, credential, automation, or architecture-changing actions
- **Be honest:** flag uncertainty before acting, say what cannot be done, surface flaws before passing, push back when a plan is unsound — see [HONESTY_PRINCIPLE.md](HONESTY_PRINCIPLE.md)

---

## Intentional Change Rule

Broad requests must be narrowed before action.

Before any significant change, frame the work:

```
Goal:
Why it matters:
Smallest useful change:
Positive effect:
Negative risk:
Stop condition:
Log destination:
```

Act only on the smallest useful change unless the operator has approved a wider scope.

If the positive effect is vague or the negative risk is hidden, pause and map the work instead of building.

One good change that keeps direction is better than ten changes that create drift.

---

## Backup Rule

Before any session that modifies core files, create a backup.

- Copy modified files into an archive folder before editing them
- Name the backup with the date: `FILENAME_BACKUP_YYYY-MM-DD.md`

**When to back up:**
- Before editing any core file
- Before restructuring folders
- Before deleting any file
- Before a session that will modify three or more files

**When you do not need a backup:**
- Filling in a blank template for the first time
- Appending new entries to a log file
- Creating a brand new file that did not previously exist

---

## State File Rule

`ACTIVE_CONTEXT` is a state snapshot, not a log. Replace it entirely at each session close. Do not append to it.

Appending turns a state file into a journal. Old entries stay visible, look authoritative, and silently mislead future agents about current reality.

**Two file types. Two different rules.**

Replace entirely at session close (state files):
- `ACTIVE_CONTEXT`

Append only — never edit past entries (history files):
- `SESSION_LOG`
- `CHANGELOG`
- Dated handoff files

If unsure which type a file is, ask: does it describe what is true *right now*, or does it record what *happened*? Now = replace. Happened = append.

---

## Minimum Viable Session Close

A full session close is ideal. Under time pressure, do these two things only.

**Step 1 — SESSION_LOG (10 seconds):**
Append one line: `YYYY-MM-DD | Agent | What changed`

**Step 2 — ACTIVE_CONTEXT (90 seconds):**
Replace entirely. Minimum fields: Last Updated + Next Step + Active Warnings

Write a handoff document when:
- A different agent picks up next
- Significant decisions were made this session
- You will not return for more than five days

A two-step close is recoverable. No close is not.

---

## Honesty Rule

Honest output is more useful and more token-efficient than confident-sounding wrong answers.

All agents must:

1. **Flag uncertainty before acting** — State confidence level (high / medium / low) and what would increase it. Do not guess and proceed.
2. **Say what cannot be done** — Name the limitation immediately and offer the smallest useful alternative. Do not present partial results as complete.
3. **Surface flaws before they pass** — If an output has a problem, flag it before moving on.
4. **Push back when a plan is unsound** — A good agent is a collaborator, not an execution machine.
5. **Build confidence before big changes** — Before any hard-to-reverse action, read the relevant state, confirm scope, and state what will change.

See [HONESTY_PRINCIPLE.md](HONESTY_PRINCIPLE.md) for detailed output formats for each rule.

Honesty is not timidity. It is precision.

---

## Backup and Restore Rule

Never restore over the live vault. Test recovery in a temporary folder first.

Before any public release, major restructuring, or long period of inactivity, run a restore readiness check:
- Verify all core files exist in both live vault and backup
- Confirm backup dates are current
- Confirm the backup can be read without any special tooling

---

## Markdown Conversion Rule

When new information, behavior, or workflow guidance would benefit future agents or the operator, convert it into a markdown note.

Convert to markdown when it:
- Improves recovery or navigation
- Reduces repeated prompting
- Explains a recurring workflow
- Preserves a decision or safety boundary
- Helps agents process the system faster

Do not convert when it:
- Is a one-off thought
- Duplicates an existing note
- Would be clearer as a short log entry

**Rule of thumb:** If a future agent would need the information to act correctly after context loss, write it in markdown.

---

## Error Learning Rule

Log recurring or instructive agent mistakes so future agents can avoid:
- Stale context
- Wrong file location
- Scope drift
- Archive material treated as current direction
- Broken links or hidden state
- Unsafe assumptions

Do not log harmless one-off wording issues.
