# Research - Public Workflow Notes

This folder documents usage patterns and system behavior from running a real
Claude Code + structured context workflow.

No fake case studies. No controlled lab benchmark claims. The public numbers in
this repository come from `stats/data.json`, which is derived from local session
logs before publication.

---

## Why Publish This

Most AI productivity content is anecdotal: "I built X fast." That is hard to
inspect.

This repo keeps a small public trail instead:

- what changed
- what tools were used
- how many sessions were tracked
- how much token activity happened
- what is intentionally not claimed yet

---

## Documents

| # | Title | What it covers |
|---|---|---|
| [001](001-token-economics.md) | Token Economics — May 2026 Foundation Build | Session data, public token totals, and cost-awareness notes |
| [002](002-cache-architecture.md) | Cache Architecture — Vault Structure for Token Efficiency | Folder design, change-rate analysis, context reuse, and token-efficiency lessons |
| [—](claude-md-template.md) | CLAUDE.md Template | Shareable starting point for Claude Code project intelligence files |

More added as data accumulates.

---

## Public Measurement Method

The public dashboard reads `stats/data.json`.

Private raw logs are not published. The public file keeps only date, token total
in millions, and session count.

---

## Publication Rule

Research notes should be useful without exposing private logs, local paths,
account details, raw prompts, or raw agent transcripts.
