# Validation

Purpose: show public-safe proof that this project is being tested, reviewed, and improved instead of presented as a finished claim.

This file is intentionally small. It should point to evidence that already exists in the repository, not become another dashboard.

Future AI Systems is proof of concept, not play. Claims should earn their place through working files, checks, logs, and clear boundaries.

---

## Current Validation Surface

| Area | Evidence | Status |
|---|---|---|
| Static site | Local preview checks for `/`, `/system/`, `/stats/`, and `/research/` | Passing |
| Mobile layout | Browser QA on narrow viewport for `/system/` and `/stats/` | Passing |
| Data file | `stats/data.json` parses as valid JSON | Passing |
| Token reporting | Public dashboard uses summarized session data, not raw private logs | Active |
| Secret safety | Pre-commit scanner plus repository secret scan | Passing |
| Local artifact control | `.gitignore` blocks QA profiles, traces, databases, and local state | Active |
| Learning record | `research/` documents what was learned without exposing private vault contents | Active |

---

## What This Proves

- The repo is more than a static landing page.
- The workflow includes testing, security checks, token tracking, and revision history.
- Public claims are tied to inspectable files instead of private chat history.
- The project is being built as a learning system, not only a sales page.

---

## What This Does Not Prove

- It does not prove client results.
- It does not prove production-scale automation.
- It does not prove long-term reliability yet.
- It does not expose private Alexandria vault notes, credentials, or personal workflows.

Those claims should stay out of the public repo until there is real evidence.

---

## Small Stress-Test Backlog

These are the next useful checks because they improve credibility without bloating the repo.

1. Cold-start review: can a new reader understand the repo from `README.md`, `system/`, `stats/`, and `research/`?
2. Data failure review: does the stats page fail cleanly if `stats/data.json` is missing or malformed?
3. Mobile regression review: do the main pages stay readable on common phone widths?
4. Secret scanner review: does the hook block obvious secrets without blocking normal documentation?
5. Workflow review: can a future agent update the repo without needing private chat context?

---

## Future Tool Boundary

Hermes or other agent harnesses may be tested later, but only as bounded experiments.

Rules:

- Do not make an agent harness part of the public site until it produces useful, reviewable evidence.
- Do not connect automation to accounts, forms, payments, or private data without manual approval.
- Do not publish private Alexandria vault material.
- Keep every public proof artifact understandable without special tooling.

The standard is simple: show significant evidence, not system bloat.
