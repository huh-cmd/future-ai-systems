# 002 — Cache Architecture: How the Vault Is Structured for Token Efficiency

**Period:** 2026-05-17 → 2026-05-25  
**System:** Alexandria vault + Claude Code session caching  
**Vault location:** Local Obsidian vault, not published  
**Model:** Claude Sonnet 4.6

---

## The problem this solves

Every Claude Code session loads context into the model's input window. If the same
content is loaded on subsequent sessions — same files, same instructions, same reference
material — you pay full input token cost each time unless it's cached.

Claude caches prompt content with a 5-minute TTL. Within that window, re-reads cost
$0.30/MTok instead of $3.00/MTok — **10× cheaper**. Beyond the window, the cache
must be rewarmed, but write cost ($3.75/MTok) is still cheaper than re-reading output
tokens.

The question is: which files are worth loading into context at all, and how do you
structure them so cache hits are maximized and misses are localized?

---

## Alexandria vault structure

The vault as of 2026-05-25:

| Folder | Files | Change rate | Cache behavior |
|--------|-------|-------------|----------------|
| `REFERENCE/` | 54 | Rarely | Near-perfect cache hits |
| `SKILLS/` | 28 | Rarely | Near-perfect cache hits |
| `PROJECTS/` | 17 | Weekly | Moderate hits |
| `ROOT` (system files) | 13 | Never mid-project | Perfect cache hits |
| `ARCHIVE/` | 8 | Never | Perfect cache hits |
| `LOGS/` | 7 | Every session | Always cache misses |
| `01_Dashboard/` | 6 | Weekly | Moderate hits |
| `DISTILLATIONS/` | 4 | Rarely | Near-perfect cache hits |
| `PEOPLE/` | 4 | Rarely | Near-perfect cache hits |
| `TASKS/` | 3 | Daily | Low hit rate |
| `CONTENT/` | 2 | Weekly | Moderate hits |
| `SPENDING/` | 1 | Monthly | High hit rate |

**Total: 163 files.** Was 56 files on 2026-05-17. Nearly 3× growth in 8 days as
project reference material was written during the foundation build.

---

## The design principle: volatile at the leaf, stable at the core

```
Alexandria vault
│
├── ROOT system files          ← Never changes mid-project
│   ├── AI_AGENT_RULES.md      ← Loaded by every session. Always cached.
│   ├── AGENTS.md
│   └── START_HERE.md
│
├── REFERENCE/ + SKILLS/       ← 82 files of curated knowledge
│   └── Changed rarely         ← Highest cache reuse across all sessions
│
├── PROJECTS/                  ← Evolves, but weekly not hourly
│   └── Updated between builds ← Cache hit on same-day sessions
│
└── LOGS/                      ← Changes every session end (hook appends)
    └── DAILY_TOKENS.md        ← Always a miss — that's intentional
```

The stable material (REFERENCE, SKILLS, ROOT) sits deep in the hierarchy and never
changes during active work. It gets loaded once, cached, and reused across every
session for days or weeks.

The volatile material (LOGS, TASKS, ACTIVE_CONTEXT) changes frequently — but it's
small and localized. One file changes, one cache miss, the rest are hits.

The worst pattern — avoided here — would be large monolithic context files that
combine stable reference data with frequently-updated state. Every update to the
volatile part would bust the cache on the stable part too.

---

## What the session data shows

```
Peak session size (MTok) — same 7-day window as research/001

Day 1 (May 18): 28.51M   Foundation build — most content written fresh
Day 2 (May 19): 16.59M   Continued — cache warming begins
Day 3 (May 20): 19.05M   Iteration — some fresh writes, more re-reads
Day 7 (May 23):  5.57M   Targeted edits — mostly cache reads
Day 8 (May 24):  3.42M   Polish — near-full cache utilization
Day 9 (May 25):  1.35M   Maintenance — cache fully warm
```

The 95% reduction reflects two compounding effects:

1. **Content is no longer being written** — fewer cache-creation tokens (at $3.75/MTok)
   once the vault and source files stabilize
2. **Repeated reads hit the cache** — the same REFERENCE and SKILLS files load at
   $0.30/MTok instead of $3.00/MTok

By day 9, a session that touches only LOGS and a few PROJECTS files is almost entirely
cache reads. The 82 REFERENCE + SKILLS files are warm and unchanged.

---

## What controls cache invalidation

A file's cache entry is invalidated when:
- Its content changes (any edit)
- The session context changes in a way that shifts its position in the input window
- The 5-minute TTL expires (cold start)

This means the folder structure has a direct cost consequence. Files that change
together should be grouped. Files that never change should be in stable folders that
don't get touched during routine work.

Examples from this vault:

| File | Changes when | Result |
|------|-------------|--------|
| `AI_AGENT_RULES.md` | Never mid-project | Always cached |
| `SKILLS/LANDING_PAGE_BUILD.md` | Rarely | Almost always cached |
| `PROJECTS/future-ai-systems.md` | After each build | Cache miss once per update |
| `LOGS/DAILY_TOKENS.md` | After every session (hook append) | Always a miss, intentional |
| `ACTIVE_CONTEXT.md` | Human-only, between sessions | Miss at session start, not mid-session |

---

## Vault growth and cache cost

The vault grew from 56 → 163 files during the May foundation period. That growth is
mostly in REFERENCE/ and SKILLS/ — stable content added once and rarely touched again.

Each new file is a one-time cache-creation cost (paid when first loaded). After that
it's cache reads forever, at 10× lower cost.

This means **adding well-structured reference material to the vault has a positive
ROI** after the first 3–4 sessions that use it. A 10K-token reference file:
- Cache write (once): 10K × $3.75/MTok = $0.0375
- Cache read (per session): 10K × $0.30/MTok = $0.003
- Break-even: 13 sessions
- After 50 sessions: $0.15 total read cost vs $1.50 to re-read fresh each time

At current usage rates (27 sessions in 8 days), a reference file breaks even in
less than 4 days.

---

## What this doesn't prove

- **The exact cache hit ratio** is not tracked. The stop hook logs raw token totals
  by type — cache_read vs input — but this data stays in the private session log.
  Publishing aggregate ratios (not raw transcripts) is the planned next step.
- **Cross-session cache persistence** above 5 minutes is not measured. The 95%
  drop likely includes both within-session caching and the effect of the context
  being smaller (less new content to write). Separating the two would require
  controlled sessions.
- **Vault size limits** — at what point does 163 files become 400 files and start
  degrading rather than helping? Not tested yet. Hypothesis: degradation starts
  when loading the full vault exceeds the context window, forcing selective loading
  and reducing hit rate on excluded files.

---

## Next: 003 — Session Shape Analysis

What does the ratio of input / cache-write / cache-read / output tokens reveal about
the type of work being done in a session? Architecture sessions look different from
maintenance sessions. The breakdown tells you which sessions were expensive, which
were cheap, and why.
