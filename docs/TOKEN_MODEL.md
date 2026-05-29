# Token Model

*How Alexandria thinks about token usage, model selection, and cost efficiency.*

---

## The Core Principle

Honest output is more token-efficient than overclaiming.

A confident-sounding wrong answer costs tokens to generate and more tokens to correct. A clear statement of uncertainty costs a few words and saves a correction session. The honesty standard is not just ethical — it is the most efficient way to work.

---

## Token Efficiency as Architecture

Token efficiency is designed into Alexandria at the structural level, not treated as an afterthought:

**Targeted retrieval over bulk loading.** Agents read the smallest useful context set before acting. The folder structure and file naming are designed so agents can navigate to exactly what they need without loading the entire vault.

**Structured notes reduce re-reading.** A note with a clear purpose line, TL;DR, and status field can be evaluated in seconds. An unstructured note may require full reading to determine whether it's relevant.

**State files over re-explanation.** ACTIVE_CONTEXT and SESSION_LOG exist so agents don't need to reconstruct session history from scratch. Starting a session from a current state file costs far fewer tokens than re-establishing context through conversation.

**Rules in the vault, not in the prompt.** Agent rules live in markdown files the agent reads — not embedded in long system prompts that must be repeated every session. This keeps prompts short and behavioral contracts durable.

---

## Model Selection Philosophy

Different tasks warrant different models. The general framework:

| Task type | Model tier |
|---|---|
| Architecture decisions, complex reasoning, multi-file work | More capable (higher cost, higher accuracy) |
| Drafting, summarizing, formatting, log entries | Faster, lower cost |
| Simple formatting, template filling | Lightest available |

**Key rules:**
- Do not use a capable model for tasks a simpler model handles correctly
- Do not use a simpler model for tasks that require judgment — errors cost more to correct than the savings on inference
- Match model to task, not to habit

---

## Recording Token Usage

Token counts, costs, and quota figures are recorded only when visible from a provider dashboard, API report, or official documentation.

- Approximate values are labeled: `Estimate`
- Unknown values are recorded as: `Unknown`
- Do not invent numbers to fill a field

This rule exists because invented token counts look authoritative in session logs and mislead future cost analysis.

---

## Cost Separation

When running multiple agent types (local models, subscription-based tools, API-billed models), maintain clear separation:

- Track which work was done on which model tier
- Note when a fallback was used (e.g., a free model failed and a paid API was used instead)
- Log any unexpected spend or quota events at the session level

Knowing where cost actually comes from is necessary for making good decisions about model routing over time.

---

## The Efficiency Test

Before adding a new file, workflow, or abstraction, apply this test:

> *If a future agent reads this, does it reduce the work they need to do — or add to it?*

Files that reduce future work (clearer rules, better navigation, preserved decisions) have positive token efficiency. Files that add noise, duplicate existing content, or require reading to determine they aren't relevant have negative token efficiency.

Build toward signal. Cut toward noise.
