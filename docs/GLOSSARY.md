# Glossary

*Shared vocabulary for agents and operators working in an Alexandria-style system.*

---

## Core Concepts

**Alexandria** — The active knowledge vault. Public-safe, reusable, agent-readable operating knowledge. The source of truth for the working system.

**Active knowledge** — Material that is current, in use, and maintained. Lives in the active vault.

**Archival layer** — Completed history from the active vault. Session logs, retired files, old changelogs. Carries the past so the present stays light.

**Private layer** — Raw, sensitive, personal, and unfinished material. Never exposed publicly. Separated at the root — not by convention, by actual folder separation.

**The triangle** — The three-layer system: active knowledge (faces outward), private work (faces inward), archival history (faces backward). All three are required for a complete operating system.

---

## Memory and Sessions

**ACTIVE_CONTEXT** — The state file. Replaced entirely at each session close. Describes current mission, last action, next step, active warnings. Never appended — it is a snapshot of now, not a history.

**SESSION_LOG** — The history file. Append-only. One line per session. Never edit past entries. The record of what happened.

**Handoff** — A markdown document that transfers full context between agents or across a long gap. Written when a different agent picks up next or significant decisions were made.

**Session open** — Read ACTIVE_CONTEXT → SESSION_LOG → specific task files before acting.

**Session close** — Append SESSION_LOG → replace ACTIVE_CONTEXT → write handoff if needed.

**State file** — Replaced entirely at close (ACTIVE_CONTEXT). Not appended.

**History file** — Append-only (SESSION_LOG, CHANGELOG). Past entries never edited.

**Context loss** — When an agent begins a session without access to recent history. The system is designed so context loss is recoverable from the vault alone.

---

## Agent Behavior

**Pipeline** — The core agent sequence: READ → UNDERSTAND → REPORT → BACKUP → ACT → LOG → HANDOFF.

**Intentional change rule** — Before any broad action, frame: Goal / Why it matters / Smallest useful change / Positive effect / Negative risk / Stop condition. Act only on the smallest useful change.

**Stop condition** — A specific outcome that halts work and requires human review. Named before acting, not discovered after.

**Scope drift** — When agent work expands beyond what was approved. Prevented by the intentional change rule and confirmed stop conditions.

**Overclaiming** — Generating confident-sounding output when the work is flawed, incomplete, or outside capability. The opposite of the honesty standard.

---

## Files and Structure

**Core files** — Files in `00_CORE`. Read before acting. Edited in place (never overwritten without backup). The behavioral backbone of the system.

**Vault** — The entire folder system. The collection of markdown files that constitutes the operating system.

**Staging** — A curated subset of vault files prepared for a specific purpose (agent session loading, publication, handoff). Not the source of truth — the vault is.

**Secret scan** — Checking files for leaked credentials, tokens, IPs, or private identifiers before any publish action.

**Vault audit** — A structured check for broken links, duplicate note names, invalid formatting, and stale references.

---

## Publication and Safety

**Public-safe** — Content with no credentials, no private identifiers, no personal details, no client information. Safe to share, publish, or open-source.

**Sanitization** — The process of removing all private identifiers before material can move from the private layer to the public layer.

**Backup rule** — Before modifying core files or restructuring folders, create a dated backup copy. No exceptions.

**Archive before delete** — Deletion is a one-way door. Move to archive first so the reasoning can be recovered, not just the final state.
