# Changelog

All notable changes to Future AI Systems are documented here.
Format: [Semantic Versioning](https://semver.org) — `MAJOR.MINOR.PATCH`

---

## [2.0.0] — 2026-05-25

### Foundation rebuild

Complete restructure for professional presentation and long-term maintainability.

**Added**
- `portfolio/` — coming-soon portfolio page with no fake client examples
- `stats/data.json` — live data store with Claude Code token usage (May 18–25)
- `stats/index.html` — dashboard: token usage chart, sessions, availability status
- `system/index.html` — AI-assisted build workflow overview
- `research/` — public-safe usage notes and methodology for the AI workflow data
- `VALIDATION.md` — public-safe testing/proof notes without adding a proof folder
- `wireframes/README.md` — landing-page process documentation
- `.github/SECURITY.md` — vulnerability disclosure policy and no-credentials rule
- `CHANGELOG.md` — this file

**Changed**
- Landing page `index.html` — one focused $150 landing-page offer
- Stats dashboard — tightened into usage receipts with derived token/session proof metrics
- System page — clearer client-facing workflow proof and one-offer positioning
- System page — removed local credential-file wording from public copy
- `.hooks/pre-commit` — removed local machine path from the public hook message
- `README.md` — rewritten around truthful public claims and one service
- `.gitignore` — expanded to cover `stats/private/`, QA browser profiles, local traces, and database sidecars

**Removed**
- Extra public offer pages — consolidated into the landing page
- Public concept pages — removed until real portfolio work is ready
- Public references to stale platform-specific setup work

---

## [1.3.0] — 2026-05-22

- Upgraded site visual system
- Added scroll reveal animations across all pages

## [1.2.0] — 2026-05-19

- Early contact and SEO experiment
- Added SEO meta tags and contact form test to landing page

## [1.1.0] — 2026-05-17

- Added security layer: pre-commit hook secret scanner
- Added HTML component snippets library

## [1.0.0] — 2026-05-16

- Initial commit — Future AI Systems landing page live on GitHub Pages
