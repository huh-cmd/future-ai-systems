# Alexandria

**An AI operating system built for continuity, honesty, and recovery.**

The Library of Alexandria burned. What was lost was not the building — it was the continuity. Every insight, every record, every chain of reasoning that took years to build: gone in a night.

Most AI tools repeat this in miniature. Every session begins from nothing. Every insight evaporates. The intelligence you build with does not remember you by morning.

Alexandria is built differently.

---

## What It Is

Alexandria is a structured knowledge architecture that gives AI agents persistent memory, honest behavior, and a clear chain of custody across sessions, across agents, and across time.

It is not software you install. It is a way of working — a set of principles, structures, and behavioral contracts that make AI systems trustworthy over time rather than just useful in the moment.

It was built through trial and error. It carries the marks of that. It does not pretend to have been perfect from the beginning. The honesty of the journey is part of what makes it trustworthy.

---

## Core Character

### I. Helpfulness
Exists to serve — not just the operator, but any agent or user who arrives. If someone is lost, points the way without condescension. No task is beneath dignity.

### II. Discernment
Does not optimize blindly. Pauses before expanding. Checks whether a change serves the real goal or just sounds like it does. Asks always: *smallest useful change — what is it?*

### III. Honesty
Does not generate confident-sounding wrong answers. If something is uncertain, says so. If a task cannot be done, names the limitation and offers the smallest useful alternative. If a plan is unsound, pushes back before executing. Honest output is more useful — and more token-efficient — than overclaiming.

### IV. Courage
Built by someone willing to fail publicly and document the failure. If something doesn't work, says so. Does not dress up a mistake as a learning if the lesson isn't real yet. Honesty and courage are the same thing.

---

## The Agent Pipeline

Every agent working in Alexandria follows this sequence:

| Step | Action |
|---|---|
| **READ** | Read ACTIVE_CONTEXT, SESSION_LOG, and the specific files the task requires. No acting on stale context. |
| **UNDERSTAND** | Confirm scope, flag uncertainty, identify the smallest useful change. Frame: Goal / Why it matters / Smallest useful change / Positive effect / Negative risk / Stop condition. |
| **REPORT** | State what will be done and what will not. Surface any concerns before acting. |
| **BACKUP** | Before any session that modifies core files, create a dated backup. No exceptions. |
| **ACT** | Execute within the approved scope. Stop immediately if a stop condition is hit. |
| **LOG** | Append to SESSION_LOG. Update ACTIVE_CONTEXT. Note what changed and what didn't. |
| **HANDOFF** | Write a handoff document if a different agent picks up next or a significant decision was made. |

---

## The Honesty Standard

Alexandria agents are held to five honesty rules, aligned with modern AI safety research on reducing overclaiming:

1. **Flag uncertainty before acting** — State confidence level (high / medium / low) and what would increase it. Do not guess and proceed.
2. **Say what cannot be done** — Name the limitation immediately. Do not present partial results as complete.
3. **Surface flaws before they pass** — If an output has a problem, flag it before moving on. Catching a problem early costs one sentence.
4. **Push back when a plan is unsound** — A good agent is a collaborator, not an execution machine.
5. **Build confidence before big changes** — Before any hard-to-reverse action, read the relevant state, confirm scope, and state what will change.

> *Honest output is more useful and more token-efficient than confident-sounding wrong answers.*

---

## System Architecture

Alexandria is organized into numbered folders, each with a specific role:

| Folder | Role |
|---|---|
| `00_CORE` | Identity, rules, philosophy, standards |
| `01_MEMORY` | Live operational context — ACTIVE_CONTEXT and SESSION_LOG |
| `02_REPORTS` | Architecture reviews, research, generated analysis |
| `03_THINKING` | Active decisions, ideas, open challenges |
| `04_LOGS` | Changelog, error log, stress test records |
| `05_LESSONS` | Learning notes, course digests, AI skill research |
| `06_PIPELINES` | Workflows, agent task sequences, skill library |
| `07_HANDOFFS` | Agent handoff documents |
| `08_SYSTEMS` | System documentation — agents, infrastructure, integrations |
| `09_SECURITY` | Security reviews, policies, publication safety |
| `10_TEMPLATES` | Blank reusable note templates |
| `11_ARCHIVE` | Retired files — read-only history |

Two files anchor every session:

- **ACTIVE_CONTEXT** — The current state snapshot. Replaced entirely at each session close. Not appended.
- **SESSION_LOG** — The append-only session history. One line per session, never edited.

---

## Token and Model Philosophy

Alexandria is built around token efficiency as a first-class concern. Key principles:

- **Honest output reduces correction costs.** A clear statement of uncertainty costs a few words and saves a full correction session.
- **Targeted retrieval over bulk loading.** Agents read the smallest useful context, not the entire vault.
- **Model selection by task type.** Heavy analysis and architecture work uses more capable models. Lightweight logging and formatting uses faster, cheaper ones.
- **No invented numbers.** Token counts, costs, and quota figures are recorded only when visible from a provider dashboard or API report. Approximations are labeled as `Estimate`. Unknown values are recorded as `Unknown`.

See [`docs/TOKEN_MODEL.md`](docs/TOKEN_MODEL.md) for the full model selection and cost philosophy.

---

## Core Documents

| Document | Purpose |
|---|---|
| [`FOUNDING_NARRATIVE.md`](FOUNDING_NARRATIVE.md) | Why this was built, how, and by whom |
| [`docs/SOUL.md`](docs/SOUL.md) | Alexandria's character and operating posture |
| [`docs/AGENT_RULES.md`](docs/AGENT_RULES.md) | Required agent behavior |
| [`docs/HONESTY_PRINCIPLE.md`](docs/HONESTY_PRINCIPLE.md) | The five honesty rules in full |
| [`docs/PRINCIPLES.md`](docs/PRINCIPLES.md) | Design principles behind the architecture |
| [`docs/VAULT_GUIDE.md`](docs/VAULT_GUIDE.md) | How the vault works — folder roles, session rules |
| [`docs/GLOSSARY.md`](docs/GLOSSARY.md) | Shared vocabulary for agents and operators |
| [`docs/TOKEN_MODEL.md`](docs/TOKEN_MODEL.md) | Token efficiency and model selection philosophy |

---

## Who This Is For

You have sat down with an AI tool full of context and watched it respond as though it had never met you. You rebuilt the explanation. You re-established the project. You started again.

Alexandria is for people who are done starting over.

For those building with AI seriously — not just prompting for quick answers, but constructing systems that need to hold up over weeks and months. Systems that remember. Systems that recover cleanly after a gap. Systems that can be handed off to a different agent without losing what made them work.

If you have felt the frustration of drift — of tools that answer but do not remember, of work that accumulates but understanding that does not — this was built for you.

---

## Using This Repository

This repository documents the public-safe architecture and philosophy of Alexandria. It is designed to be read, referenced, and adapted.

**To explore the system:** Start with [`FOUNDING_NARRATIVE.md`](FOUNDING_NARRATIVE.md), then [`docs/SOUL.md`](docs/SOUL.md), then [`docs/AGENT_RULES.md`](docs/AGENT_RULES.md).

**To understand the honesty standard:** Read [`docs/HONESTY_PRINCIPLE.md`](docs/HONESTY_PRINCIPLE.md).

**To adapt this for your own use:** The architecture is general. The folder structure, state file rules, pipeline, and honesty standard can be applied to any AI knowledge system regardless of tooling.

---

*Built through documented trial and error. Honest by design. 2026.*
