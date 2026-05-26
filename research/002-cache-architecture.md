# 002 — Cache Architecture: How the Vault Is Structured for Token Efficiency

**Period:** 2026-05-17 → 2026-05-25  
**System:** Alexandria vault + Claude Code session caching  
**Vault location:** Local Obsidian vault, not published  
**Model:** Claude Code sessions using the then-current Claude setup

**Status:** workflow observation, not a controlled benchmark

---

## The problem this solves

Every Claude Code session loads context into the model's input window. If the same
content is loaded repeatedly — same files, same instructions, same reference
material — caching can reduce repeated input cost when the provider supports it.

Exact cache pricing, model pricing, and cache behavior can change. This note uses
the public token trail as a workflow observation: stable context appears cheaper
and easier to reuse than constantly rebuilding context from scratch.

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

These counts were a snapshot during the foundation build, not a permanent public
claim. The important pattern is the structure: stable reference material is kept
separate from volatile session state.

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

The drop in logged token totals likely reflects two compounding effects:

1. **Content is no longer being written** — fewer large foundation-building sessions
   once the vault and source files stabilize
2. **Repeated context becomes easier to reuse** — stable reference material does
   not need to be rediscovered or rewritten each session

By day 9, the work had shifted from foundation building to maintenance. That is
the main public claim. Exact cache hit ratios are not published.

---

## What controls cache invalidation

In general, repeated context can become less reusable when:

- File content changes.
- The prompt/session shape changes.
- The provider cache expires.
- Too much unrelated context is loaded.

This means folder structure has a practical consequence. Files that change together
should be grouped. Files that rarely change should stay separate from routine logs
and state files.

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

The vault grew substantially during the May foundation period. That growth was
mostly stable reference and skill material, not volatile session state.

Each useful reference note has an upfront cost: it must be written, reviewed, and
loaded when relevant. It only pays off if future sessions reuse it.

This means **well-structured reference material can have positive workflow ROI**
when it prevents repeated explanation, repeated prompting, and repeated search.

The practical rule: add reference notes only when they reduce repeated work. Do
not add notes just to grow the vault.

---

## What this doesn't prove

- **The exact cache hit ratio** is not published. The stop hook logs raw token totals
  by type — cache_read vs input — but this data stays in the private session log.
  Publishing aggregate ratios (not raw transcripts) is the planned next step.
- **Cross-session cache persistence** is not measured publicly. The token drop
  likely includes both caching and the fact that later sessions were smaller,
  more targeted, and less architecture-heavy. Separating those causes would
  require controlled sessions.
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
