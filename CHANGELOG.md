# Changelog

All notable changes to Future AI Systems are documented here.
Format: [Semantic Versioning](https://semver.org) — `MAJOR.MINOR.PATCH`

---

## [2.0.0] — 2026-05-25

### Foundation rebuild

Complete restructure for professional presentation and long-term maintainability.

**Added**
- `portfolio/` — 4 sample landing pages recovered and organized (fitness, consulting, music, restaurant)
- `stats/data.json` — live data store with real Claude Code token usage (May 18–25)
- `stats/index.html` — dashboard: token usage chart, portfolio builds, availability status
- `system/index.html` — Alexandria AI system overview: architecture, agent roles, tools, philosophy
- `wireframes/README.md` — design process documentation
- `.github/SECURITY.md` — vulnerability disclosure policy and no-credentials rule
- `CHANGELOG.md` — this file; version history from day one

**Changed**
- Landing page `index.html` — single offer, real pricing ($150), clean copy
- `README.md` — fully rewritten: professional, data-driven, unique positioning
- `.gitignore` — expanded to cover `stats/private/`, `*.tmp`, `*.bak`
- `clients/` renamed to `portfolio/` — clearer naming

**Removed**
- `services.html` — consolidated into landing page (single offer, no page sprawl)
- Dead `~` directory artifact

---

## [1.3.0] — 2026-05-22

- Upgraded portfolio to Linear/Stripe-style design system
- Added Kai Rivers (music) and Ember Kitchen (restaurant) sample pages
- Added scroll reveal animations across all pages

## [1.2.0] — 2026-05-19

- Upwork profile verified and active
- Added SEO meta tags and Formspree contact form to landing page

## [1.1.0] — 2026-05-17

- Deployed Marcus Webb (fitness) and Priya Sharma (consulting) portfolio pages
- Added security layer: pre-commit hook secret scanner
- Added HTML component snippets library

## [1.0.0] — 2026-05-16

- Initial commit — Future AI Systems landing page live on GitHub Pages
