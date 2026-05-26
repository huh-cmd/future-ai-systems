# Token Economics - May 2026 Foundation Build

Status: public-safe research note

Purpose: explain what the May 2026 usage data proves and what it does not prove.

Source: `stats/data.json`

---

## Summary

The May 2026 data shows repeated AI-assisted build sessions across a small static
site and supporting documentation system.

The useful lesson is not "more tokens equals better work." The useful lesson is
that an AI workflow becomes easier to inspect when session activity is logged in
a simple public-safe format.

---

## What Is Tracked Publicly

| Field | Meaning |
|---|---|
| Date | active build day |
| Tokens | total logged tokens in millions |
| Sessions | tracked Claude Code sessions for that day |

Raw transcripts, private logs, local paths, prompts, and account details are not
published.

---

## Observed Pattern

Early foundation sessions used the most context because they established:

- repository structure
- landing page copy and layout
- security policy
- stats dashboard
- wireframe process
- public documentation language

Later sessions are smaller because the workflow has more written structure to
reuse.

---

## Practical Lesson

The project benefits from making work visible:

- token totals show real activity
- session counts show cadence
- repo notes show what changed during public proof passes
- security rules show what should not be published

This is more useful than claiming speed without receipts.

---

## Limits

This data should not be treated as a universal benchmark.

It reflects one workflow, one machine, one repo, and one operator. It is useful
as proof of active building and process maturity, not as a promise about exact
cost, speed, or delivery time.

---

## Keep Improving

Future research notes should stay small, public-safe, and tied to real repo
behavior.

Do not publish raw logs just to make the numbers look more impressive.
