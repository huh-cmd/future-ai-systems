# Future AI Systems

> Landing pages built with AI. Fast, clean, and priced to move.

[![Status](https://img.shields.io/badge/availability-open-22c55e?style=flat-square)](https://huh-cmd.github.io/future-ai-systems/)
[![Built with Claude Code](https://img.shields.io/badge/built%20with-Claude%20Code-7c6af5?style=flat-square)](https://claude.ai/claude-code)
[![GitHub Pages](https://img.shields.io/badge/hosted%20on-GitHub%20Pages-0a0a0a?style=flat-square&logo=github)](https://huh-cmd.github.io/future-ai-systems/)

**Live site:** [huh-cmd.github.io/future-ai-systems](https://huh-cmd.github.io/future-ai-systems/)  
**Portfolio:** [/portfolio/](https://huh-cmd.github.io/future-ai-systems/portfolio/)  
**How it works:** [/system/](https://huh-cmd.github.io/future-ai-systems/system/)  
**Stats:** [/stats/](https://huh-cmd.github.io/future-ai-systems/stats/)

---

## What this is

A one-service freelance site: custom landing pages at a flat rate, built using a structured AI system (Claude Code + Alexandria vault). No page builders, no templates, no frameworks. Pure HTML/CSS/JS.

Single offer until the first client ships. Then expand.

---

## The stack

| Tool | Role |
|------|------|
| **Claude Code** | Primary build agent — all HTML, CSS, JS, architecture |
| **Obsidian + Alexandria** | 91-file knowledge vault — carries context across sessions |
| **GitHub Pages** | Static hosting — deploy on push, zero maintenance |
| **PowerShell** | Automation — token tracking hook, vault health checks |

Token usage is auto-tracked via Claude Code stop hook → `DAILY_TOKENS.md` → `stats/data.json`.

---

## Repo structure

```
future-ai-systems/
├── .github/SECURITY.md       # Vulnerability policy
├── .hooks/pre-commit         # Secret scanner — runs on every commit
├── portfolio/                # 4 sample landing pages
│   ├── marcus-webb/          # Fitness — dark theme
│   ├── priya-sharma/         # Consulting — light theme
│   ├── kai-rivers/           # Music — navy/electric blue
│   └── ember-kitchen/        # Restaurant — warm charcoal
├── stats/
│   ├── data.json             # Live metrics (builds, tokens, revenue)
│   └── index.html            # Chart dashboard
├── system/
│   └── index.html            # Alexandria + tools overview
├── wireframes/
│   └── README.md             # Design process, ASCII wireframes, token table
├── .gitignore                # Blocks .env *.key *.pem *.secret stats/private/
├── CHANGELOG.md              # Version history
├── README.md                 # This file
└── index.html                # Landing page
```

---

## Security

- `.gitignore` blocks all credential patterns
- Pre-commit hook scans every commit for secrets
- `SECURITY.md` documents the no-credentials policy
- No backend, no user data, no authentication

See [`.github/SECURITY.md`](.github/SECURITY.md) for the vulnerability reporting process.

---

## AI token data — May 2026 (real)

Tracked automatically. Numbers are max tokens per session per day.

| Date | Tokens | Sessions |
|------|--------|----------|
| 2026-05-18 | 28.51M | 13 |
| 2026-05-19 | 16.59M | 2 |
| 2026-05-20 | 19.05M | 6 |
| 2026-05-23 | 5.57M | 1 |
| 2026-05-24 | 3.42M | 3 |
| 2026-05-25 | 1.35M | 2 |

High early numbers = architecture + full repo foundation build. Cache-read tokens dominate — the system is tuned for high cache utilization (fast, cheap re-reads).

Full dashboard: [/stats/](https://huh-cmd.github.io/future-ai-systems/stats/)

---

## Design process

Every page starts as a wireframe. Full process documented in [`wireframes/README.md`](wireframes/README.md).

```
Intake → Wireframe → Tokens → Claude Code build → Mobile pass → Deliver
```

Average build time: 2–4 hours per page.

---

## Pricing

| Service | Price |
|---------|-------|
| One-page landing page | $150 flat |
| Two-page (landing + services) | $250 flat |
| Rush (48hr) | +$75 |

One free revision. Delivered as a live GitHub Pages URL or as a zip of clean HTML/CSS/JS files.

**Contact:** jeffe5196@gmail.com

---

## Changelog

See [`CHANGELOG.md`](CHANGELOG.md) for the full version history.

Current version: **2.0.0** — Foundation rebuild (2026-05-25)

---

## License

Portfolio sample pages (Marcus Webb, Priya Sharma, Kai Rivers, Ember Kitchen) are fictional — not real clients. Used for demonstration only.

Code is available for reference. Do not resell or reuse without permission.

