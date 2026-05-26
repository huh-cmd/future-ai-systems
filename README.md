# Future AI Systems

> Landing pages built with AI. Focused, clean, and priced to move.

[![Status](https://img.shields.io/badge/availability-open-22c55e?style=flat-square)](https://huh-cmd.github.io/future-ai-systems/)
[![Built with Claude Code](https://img.shields.io/badge/built%20with-Claude%20Code-7c6af5?style=flat-square)](https://claude.ai/claude-code)
[![GitHub Pages](https://img.shields.io/badge/hosted%20on-GitHub%20Pages-0a0a0a?style=flat-square&logo=github)](https://huh-cmd.github.io/future-ai-systems/)

**Live site:** [huh-cmd.github.io/future-ai-systems](https://huh-cmd.github.io/future-ai-systems/)  
**Portfolio:** [/portfolio/](https://huh-cmd.github.io/future-ai-systems/portfolio/)  
**How it works:** [/system/](https://huh-cmd.github.io/future-ai-systems/system/)  
**Stats:** [/stats/](https://huh-cmd.github.io/future-ai-systems/stats/)

---

## What This Is

A one-service site: custom landing pages at a flat $150 rate, built using a structured AI workflow with Claude Code and human review. No page builders, no WordPress, no frameworks. Clean HTML/CSS/JS.

Single offer until real client work ships cleanly. Then expand only if demand is proven.

This repository is a public record of the workflow: token receipts, security policy, validation notes, and research notes are kept inspectable so the claims stay grounded.

---

## The Stack

| Tool | Role |
|---|---|
| **Claude Code** | Primary build tool: HTML, CSS, JS, structure, review |
| **GitHub Pages** | Static hosting — deploy on push, zero maintenance |
| **PowerShell** | Automation: token tracking hook |

---

## AI Token Data — May 2026

| Date | Tokens | Sessions |
|---|---:|---:|
| 2026-05-18 | 28.51M | 13 |
| 2026-05-19 | 16.59M | 2 |
| 2026-05-20 | 19.05M | 6 |
| 2026-05-23 | 5.57M | 1 |
| 2026-05-24 | 3.42M | 3 |
| 2026-05-25 | 1.35M | 2 |

High early numbers reflect architecture and full repo foundation work. Some totals include cache-read tokens from long build sessions.

Full dashboard: [/stats/](https://huh-cmd.github.io/future-ai-systems/stats/)

---

## Design Process

```
Intake → Wireframe → Token selection → Claude Code build → Mobile pass → Deliver
```

Average build time: 2–4 hours per page.

---

## Pricing

| Service | Price |
|---|---:|
| Landing page | $150 flat |

One free revision. Delivered as a live GitHub Pages URL or zip of clean HTML/CSS/JS. No fake testimonials, fake numbers, or fake client logos.

**Contact:** jeffe5196@gmail.com

---

## Repo Structure

```text
future-ai-systems/
├── .github/SECURITY.md       # Vulnerability policy
├── .hooks/pre-commit         # Secret scanner
├── portfolio/                # Portfolio page
├── research/                 # Public workflow notes
├── stats/
│   ├── data.json             # Public metrics and token receipts
│   └── index.html            # Chart dashboard
├── system/
│   └── index.html            # Workflow and tools overview
├── wireframes/               # Design process notes
├── .gitignore                # Blocks secrets, local state, QA profiles
├── VALIDATION.md             # Testing and proof notes
├── README.md                 # This file
└── index.html                # Landing page
```

---

## Security

- `.gitignore` blocks credential patterns and local-only artifacts.
- Pre-commit hook scans staged files for secret-like patterns.
- No backend, no user data, no authentication.

See [`.github/SECURITY.md`](.github/SECURITY.md) for the vulnerability reporting policy.

---

Code is available for reference. Do not resell or reuse without permission.
