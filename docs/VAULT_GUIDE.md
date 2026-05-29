# Vault Guide

*How an Alexandria-style system works — folder roles, session rules, and what lives where.*

---

## The Core Idea

An Alexandria vault is a folder of markdown files organized so that both humans and AI agents can navigate it without chat history. Every folder has a role. Every file has a purpose line. Every session has a close.

The vault is the source of truth. Agent memory, chat history, and temporary context are derivatives.

---

## Folder Structure

| Folder | Role |
|---|---|
| `00_CORE` | Identity, rules, philosophy, standards — read before acting |
| `01_MEMORY` | Live operational context — ACTIVE_CONTEXT and SESSION_LOG |
| `02_REPORTS` | Architecture reviews, research, generated analysis |
| `03_THINKING` | Active decisions, ideas, open challenges, thinking traces |
| `04_LOGS` | Changelog, error log, stress test records, token log |
| `05_LESSONS` | Learning notes, course digests, AI skill research |
| `06_PIPELINES` | Workflows, agent task sequences, skill library |
| `07_HANDOFFS` | Agent handoff documents |
| `08_SYSTEMS` | System documentation — agents, infrastructure, integrations |
| `09_SECURITY` | Security reviews, policies, publication safety |
| `10_TEMPLATES` | Blank reusable note templates |
| `11_ARCHIVE` | Retired files — read-only history, do not treat as current |

---

## The Two Anchoring Files

These two files are the minimum required for session continuity:

### ACTIVE_CONTEXT
The current state snapshot. Contains: current mission, last completed action, next step, active warnings.

**Rule:** Replace entirely at each session close. Do not append. This is a state file, not a log. Old entries left in a state file look authoritative and silently mislead future agents.

### SESSION_LOG
The append-only session history. One line per session: `YYYY-MM-DD | Agent | What changed`.

**Rule:** Append only. Never edit past entries. This is a history file — past entries are permanent.

---

## Session Rules

**Session open:**
1. Read ACTIVE_CONTEXT
2. Read SESSION_LOG (last 10 entries minimum)
3. Read the specific files your task requires
4. Flag anything stale before acting

**Session close:**
1. Append one line to SESSION_LOG
2. Replace ACTIVE_CONTEXT entirely (minimum: Last Updated + Next Step + Active Warnings)
3. Write a handoff document if a different agent picks up next or significant decisions were made

A two-step close (log + state update) is recoverable. No close is not.

---

## Note Format Standard

Every important note should have:

```markdown
Status: active | archive | draft
Created: YYYY-MM-DD
Purpose: one sentence — why this note exists

> **TL;DR:** one sentence summary (required for notes over 20 lines)
```

Notes that affect recovery, navigation, safety, or repeated agent behavior should also have:
- A clear **Use when** line
- Related notes linked by name

---

## What Belongs Where

**In the active vault (public-safe layer):**
- Sanitized workflows and templates (no personal context)
- Agent rules and safety boundaries
- Public-safe architecture and system docs
- Lessons stripped of private details
- Reference notes with no credentials or personal identifiers

**Not in the active vault:**
- Personal ideas still in progress
- Client names, contact details, project specifics
- Pricing decisions, negotiation notes
- Private goals and journal-style notes
- API keys, tokens, passwords, or any credentials

The boundary between active and private is non-negotiable. If content could harm you if made public, it does not belong in the public-safe layer.

---

## Key Behaviors

**Backup before major changes.** Before editing core files or restructuring folders, create a dated backup copy. No exceptions.

**Archive before delete.** Deletion is a one-way door. Archive first.

**One canonical location per fact.** Each important fact has one home. Other notes link to it — they do not duplicate it.

**Smallest useful change.** The instinct is to rebuild everything at once. The result is drift and broken context. One change, verified and working, is worth more than ten that haven't been tested.
