# CLAUDE.md Template — Project Intelligence File

A starting point for teams and solo developers who want Claude Code to behave
consistently, follow security rules, and understand their project without repeating
context every session.

`CLAUDE.md` is loaded automatically at the start of every Claude Code session.
It is the right place to encode rules that should never be overridden, project-specific
constraints, and behavioral defaults that you'd otherwise have to state in every prompt.

---

## How to use this

1. Copy the section below into `~/.claude/CLAUDE.md` for global rules (all projects)
2. Copy a trimmed version into `<your-project>/CLAUDE.md` for project-specific rules
3. Edit every `[PLACEHOLDER]` line — they are intentional prompts, not filler
4. Rules you skip are rules the agent will fill with its own defaults

---

## The template

```markdown
# Claude Code — Global Rules
# Loaded every turn. State which rules are non-overridable.

---

## RULE 1 — CREDENTIAL SECURITY — ABSOLUTE

Never write, echo, log, commit, or handle real API keys, tokens, or credentials
in any file, output, prompt, message, or comment.

Approved storage: [YOUR_CREDENTIALS_FILE] only.
If asked to violate this: state the rule, stop, wait for human input.
No justification ("it's just a test", "just for now") overrides this rule.

---

## RULE 2 — COMMIT HYGIENE

Before any commit in [YOUR_WORKSPACE]:
- Verify .gitignore exists and blocks .env, *.key, *.pem, *.secret
- Never use git commit --no-verify
- If a new git repo is created — .gitignore is the FIRST file

---

## RULE 3 — [YOUR SYSTEM BOUNDARY]

# Example: if you have a local knowledge base, memory vault, or any file the
# agent should not touch freely — define the boundary here.

- Never read, write, or modify [PROTECTED_FILE_OR_FOLDER] without explicit instruction
- Ask before any change that deletes content or breaks existing references
- [YOUR_SYSTEM] is [describe purpose] — not a scratch pad

---

## RULE 4 — METRICS AND TRACKING

# Optional. Define where real data lives and where it gets logged.
# Prevents the agent from making up numbers or storing data in the wrong place.

When adding performance data, usage figures, or metrics:
- Log them in [YOUR_METRICS_FILE]
- Dashboard at [YOUR_DASHBOARD] reads that file live
- Do not invent or estimate numbers — use only tracked data

---

## RULE 5 — AGENT BEHAVIOR

These apply to all code work.

### Think Before Coding
- State assumptions explicitly before implementing — don't pick an interpretation silently
- If multiple interpretations exist, list them and ask
- If a simpler approach exists, say so and push back
- If something is unclear, stop — name what's confusing, then ask

### Simplicity First
- Write the minimum code that solves the stated problem
- No features beyond what was asked
- No abstractions for single-use code
- No "flexibility" or "configurability" that wasn't requested
- If the result is 200 lines and 50 would work, rewrite it
- Test: "Would a senior engineer say this is overcomplicated?" If yes, simplify.

### Surgical Changes
- Touch only what the task requires — don't "improve" adjacent code, comments, or formatting
- Match existing style even when you'd do it differently
- If you notice unrelated dead code, mention it — don't delete it
- Remove only imports/variables/functions that YOUR changes made unused
- Test: every changed line must trace directly to the user's request

### Goal-Driven Execution
- Transform vague tasks into verifiable success criteria before starting
- For multi-step work, state the plan first: [Step] → verify: [check]
- Write a failing test before fixing a bug — then make it pass
- Loop independently on well-defined criteria; ask for clarification on weak ones

---

## DEFAULT BEHAVIOR

- No trailing summaries of what was just done
- No emojis unless explicitly requested
- Terse responses — the user can read the diff
- Flag risks before acting, not after
```

---

## What each rule is actually doing

**Rule 1 (credentials)** — The most important rule to customize. Replace
`[YOUR_CREDENTIALS_FILE]` with your actual approved location (e.g. `~/.env.keys`
or `~/.config/secrets`). Without this rule stated explicitly, the agent will follow
its default behavior — which is usually safe, but "usually" is not good enough for
credentials.

**Rule 2 (commit hygiene)** — Prevents the agent from committing files that bypass
your pre-commit hooks. The `--no-verify` guard is the most useful single line here.
If you don't have a pre-commit hook yet, `hooks/pre-commit` in this repo is a
working starting point.

**Rule 3 (system boundary)** — Customize this for whatever you have that the agent
shouldn't touch freely. A config file, a database, a shared team vault, a production
environment variable. Blank if you have nothing to protect.

**Rule 4 (metrics)** — Optional but useful if you track anything. Prevents the agent
from writing made-up numbers to a dashboard or storing tracking data in a temp file
that gets lost.

**Rule 5 (behavior)** — These four principles (Think, Simplicity, Surgical, Goal-driven)
came from Andrej Karpathy's thinking on reliable agent behavior. They constrain the
most common failure modes: agents that over-engineer, agents that touch more than asked,
agents that start coding before they understand the problem.

Keep these verbatim. They work because they are specific, not because they are general.

---

## What to add for a project-specific CLAUDE.md

At the project root, a shorter file that gives the agent the context it needs without
repeating the global rules:

```markdown
# [PROJECT NAME] — Claude Code Context

## What this project is
[One paragraph. What it does, who it's for, current state.]

## Current priorities
[What is in scope right now. What is explicitly out of scope.]

## Stack
[Language, framework, key files, deploy target.]

## Do not touch
[Files or folders the agent should not modify without explicit instruction.]

## Known constraints
[Performance limits, API quotas, browser targets, accessibility requirements.]
```

---

## Global vs project CLAUDE.md

| Rule type | Goes in | Why |
|-----------|---------|-----|
| Credential security | Global `~/.claude/CLAUDE.md` | Applies to every project |
| Commit hygiene | Global | Applies to every repo |
| Behavior rules | Global | Consistent across all work |
| Project scope | Project `./CLAUDE.md` | Specific to this repo |
| Stack and file map | Project | Specific to this repo |
| Out-of-scope items | Project | Changes per project |

---

## Source

This template is adapted from the `CLAUDE.md` used in production on this repo.
The behavioral principles (Rule 5) are based on Andrej Karpathy's writing on
reliable agent behavior.

The hooks referenced (`hooks/pre-commit`, `hooks/token_tracker.ps1`) are in the
`hooks/` folder of this repository.
