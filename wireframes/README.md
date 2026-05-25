# Design Process — Wireframes & Build Notes

Every page built at Future AI Systems starts here: a structured wireframe that defines layout, hierarchy, and intent before the build begins. This is the discipline that separates fast, coherent builds from iterative guesswork.

---

## Standard Build Flow

```
1. Intake
   Client fills brief: goal, audience, tone, reference sites
   ↓
2. Wireframe (text or ASCII)
   Define sections, hierarchy, copy slots
   ↓
3. Design token selection
   Color palette, typography, spacing scale
   ↓
4. Claude Code build
   HTML/CSS/JS — no page builders, no frameworks
   ↓
5. Scroll + animation layer
   Intersection Observer — reveal on scroll
   ↓
6. Mobile pass
   375px baseline, test at 768px, 1280px
   ↓
7. Deliver + review
   Live URL, one free revision
```

---

## Baseline Wireframe — Landing Page

```
┌─────────────────────────────────────────────┐
│ NAV: Logo · Services · Work · Contact [CTA] │
├─────────────────────────────────────────────┤
│                                             │
│  HERO                                       │
│  H1: Bold claim (2 lines max)               │
│  Sub: One-sentence proof                    │
│  CTA button + secondary link                │
│  [Background: dark gradient mesh]           │
│                                             │
├─────────────────────────────────────────────┤
│  PROOF / TRUST SECTION                      │
│  Only real proof: process, work, facts      │
├─────────────────────────────────────────────┤
│  SERVICES BENTO GRID                        │
│  [Card] [Card] [Card]                       │
│  [Card — wide]                              │
├─────────────────────────────────────────────┤
│  DETAILS / FAQ                              │
│  Scope · timeline · what is not included    │
├─────────────────────────────────────────────┤
│  CTA SECTION                                │
│  Headline + button + subtext                │
├─────────────────────────────────────────────┤
│  FOOTER: Nav · Social · Legal               │
└─────────────────────────────────────────────┘
```

---

## Design Tokens Used

| Token        | Value                                  | Usage                  |
|-------------|----------------------------------------|------------------------|
| `--black`   | `#050505`                              | Text headings          |
| `--ink`     | `#111`                                 | Body text              |
| `--muted`   | `#5d5d5d`                              | Secondary text         |
| `--line`    | `#d8d8d8`                              | Borders, dividers      |
| `--soft`    | `#f5f5f3`                              | Section backgrounds    |
| `--shadow`  | `0 24px 80px rgba(0,0,0,0.12)`         | Card elevation         |
| Font stack  | Inter → ui-sans-serif → system-ui     | All pages              |
| Base unit   | `4px` grid, spacing via `min()` clamp  | Layout                 |

---

## Notes

- All pages pass 375px mobile without horizontal scroll
- Animations use `IntersectionObserver` — no GSAP dependency
- No external CSS frameworks — clean vanilla code via Claude Code
- Average build time: 2–4 hours per page (with Claude Code)
