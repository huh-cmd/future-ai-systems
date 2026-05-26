# Security Policy

## No Credentials in This Repo

This repository is a public static site. The following **must never** appear in any file, commit, comment, or log:

- API keys or tokens
- Passwords or credentials
- `.env` contents
- Private keys (`.pem`, `.key`)
- OAuth secrets

Approved credential storage: environment variables loaded at runtime, never hardcoded.

## Customer API Key Handoff

If a future customer project needs Claude, OpenAI, or another API provider, the
customer should own the API key, account, billing, and data.

Handoff rule:

- Use placeholders in source code and examples.
- Put real keys in customer-owned environment variables, hosting secrets, or a local `.env` file.
- Never commit real keys to GitHub.
- Never send real keys in screenshots, public issues, or logs.
- Rotate any key that may have been exposed during setup.

See [`../CUSTOMER_HANDOFF.md`](../CUSTOMER_HANDOFF.md) for the plain-language
handoff process.

## Pre-Commit Protection

A pre-commit hook runs on every commit to scan for patterns that look like secrets. Do not bypass it with `--no-verify`.

If the hook flags a false positive, update the allowlist in `.hooks/pre-commit` — do not skip the hook.

## Reporting a Vulnerability

If you find a security issue in this codebase:

1. **Do not open a public issue.**
2. Email: jeffe5196@gmail.com with subject line `SECURITY:`
3. Include: what you found, reproduction steps, and potential impact.

Response within 48 hours.

## Scope

This repo contains only static HTML/CSS/JS. There is no backend, no database, no authentication.
Known non-issues: there are no user accounts, no data collection, no server-side processing.
