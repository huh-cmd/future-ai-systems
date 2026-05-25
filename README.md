# Future AI Systems

> Landing pages built with AI. Focused, clean, and priced to move.

[![Status](https://img.shields.io/badge/availability-open-22c55e?style=flat-square)](https://huh-cmd.github.io/future-ai-systems/)
[![Built with Claude Code](https://img.shields.io/badge/built%20with-Claude%20Code-7c6af5?style=flat-square)](https://claude.ai/claude-code)
[![GitHub Pages](https://img.shields.io/badge/hosted%20on-GitHub%20Pages-0a0a0a?style=flat-square&logo=github)](https://huh-cmd.github.io/future-ai-systems/)

**Live site:** [huh-cmd.github.io/future-ai-systems](https://huh-cmd.github.io/future-ai-systems/)  
**Portfolio:** [/portfolio/](https://huh-cmd.github.io/future-ai-systems/portfolio/)  
**How it works:** [/system/](https://huh-cmd.github.io/future-ai-systems/system/)  
**Stats:** [/stats/](https://huh-cmd.github.io/future-ai-systems/stats/)  
**Research:** [`/research/`](research/)  
**Validation:** [`VALIDATION.md`](VALIDATION.md)

---

## What This Is

A one-service site: custom landing pages at a flat $150 rate, built using a
structured AI workflow with Claude Code and human review. No page builders, no
WordPress, no frameworks. Clean HTML/CSS/JS.

Single offer until real client work ships cleanly. Then expand only if demand is
proven.

This repository is also a public record of the workflow: the site, wireframes,
token receipts, security policy, validation notes, and research notes are kept
inspectable so the claims stay grounded.

---

## The Stack

| Tool | Role |
|---|---|
| **Claude Code** | Primary build tool: HTML, CSS, JS, structure, review support |
| **Obsidian + Alexandria** | Knowledge vault that carries context across sessions |
| **GitHub Pages** | Static hosting: deploy on push, zero maintenance |
| **PowerShell** | Automation: token tracking hook and vault health checks |

Token usage is summarized from local Claude Code session logs into
`stats/data.json` before publication.

---

## Repo Structure

```text
future-ai-systems/
├── .github/SECURITY.md       # Vulnerability policy
├── .hooks/pre-commit         # Secret scanner
├── hooks/                    # Shareable hook examples and install notes
├── portfolio/                # Coming-soon portfolio page
├── stats/
│   ├── data.json             # Public metrics and token receipts
│   └── index.html            # Chart dashboard
├── system/
│   └── index.html            # Workflow and tools overview
├── research/
│   ├── README.md                  # Methodology and index
│   ├── 001-token-economics.md     # Cost breakdown, cache warmup curve
│   ├── 002-cache-architecture.md  # Vault structure, cache ROI math
│   └── claude-md-template.md      # Shareable CLAUDE.md starter
├── wireframes/
│   └── README.md             # Design process and wireframes
├── .gitignore                # Blocks secrets, local state, traces, QA profiles
├── CHANGELOG.md              # Version history
├── VALIDATION.md             # Public-safe testing and proof notes
├── README.md                 # This file
└── index.html                # Landing page
```

---

## Security

- `.gitignore` blocks credential patterns and local-only artifacts.
- Pre-commit hook scans staged files for secret-like patterns.
- `SECURITY.md` documents the no-credentials policy.
- No backend, no user data, no authentication.
- Local QA browser profiles, traces, and database files are ignored by default.

See [`.github/SECURITY.md`](.github/SECURITY.md) for the vulnerability reporting
process.

---

## AI Token Data - May 2026

Tracked locally, then summarized for publication. Numbers are logged token
totals by active day.

| Date | Tokens | Sessions |
|---|---:|---:|
| 2026-05-18 | 28.51M | 13 |
| 2026-05-19 | 16.59M | 2 |
| 2026-05-20 | 19.05M | 6 |
| 2026-05-23 | 5.57M | 1 |
| 2026-05-24 | 3.42M | 3 |
| 2026-05-25 | 1.35M | 2 |

High early numbers reflect architecture and full repo foundation work. Some
totals include cache-read tokens from long build sessions.

Full dashboard: [/stats/](https://huh-cmd.github.io/future-ai-systems/stats/)

---

## Design Process

Every page starts as a wireframe. Full process documented in
[`wireframes/README.md`](wireframes/README.md).

```text
Intake -> Wireframe -> Tokens -> Claude Code build -> Mobile pass -> Deliver
```

Average build time: 2-4 hours per page.

---

## Pricing

| Service | Price |
|---|---:|
| Landing page | $150 flat |

One free revision. Delivered as a live GitHub Pages URL or as a zip of clean
HTML/CSS/JS files. No fake testimonials, fake numbers, or fake client logos.

**Contact:** jeffe5196@gmail.com

---

## Changelog

See [`CHANGELOG.md`](CHANGELOG.md) for the full version history.

Current version: **2.0.0** - Foundation rebuild (2026-05-25)

---

## License

Code is available for reference. Do not resell or reuse without permission.
