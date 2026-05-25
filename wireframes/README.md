# Design Process — Wireframes & Build Notes

Every page built at Future AI Systems starts here: a structured wireframe that defines layout, hierarchy, and intent before a single line of CSS is written. This is the discipline that separates fast, coherent builds from iterative guesswork.

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

## Sample Wireframe — Fitness Landing Page (Marcus Webb)

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
│  SOCIAL PROOF BAR                           │
│  3 stats: clients · weeks · satisfaction   │
├─────────────────────────────────────────────┤
│  SERVICES BENTO GRID                        │
│  [Card] [Card] [Card]                       │
│  [Card — wide]                              │
├─────────────────────────────────────────────┤
│  TESTIMONIALS                               │
│  Quote · Name · Role (×3)                  │
├─────────────────────────────────────────────┤
│  CTA SECTION                                │
│  Headline + button + subtext                │
├─────────────────────────────────────────────┤
│  FOOTER: Nav · Social · Legal               │
└─────────────────────────────────────────────┘
```

---

## Sample Wireframe — Consulting Landing Page (Priya Sharma)

```
┌─────────────────────────────────────────────┐
│ NAV: Logo · About · Services · Contact      │
├─────────────────────────────────────────────┤
│  HERO                                       │
│  H1: Position + outcome                     │
│  Sub: Who this is for                       │
│  CTA: Book a call                           │
│  [Background: light, clean grid]            │
├─────────────────────────────────────────────┤
│  CREDIBILITY BAR                            │
│  Logos or badges (4 items)                  │
├─────────────────────────────────────────────┤
│  SERVICES: 3-column cards                  │
│  Icon · Title · 2-line description          │
├─────────────────────────────────────────────┤
│  PROCESS: Numbered steps (3–4)              │
├─────────────────────────────────────────────┤
│  TESTIMONIAL: Full-width quote              │
├─────────────────────────────────────────────┤
│  CONTACT FORM                               │
│  Name · Email · Message · Submit            │
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
- No external CSS frameworks — every line is hand-written
- Average build time: 2–4 hours per page (with Claude Code)
