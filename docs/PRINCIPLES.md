# Principles

*These principles explain why Alexandria is structured the way it is. The rules file contains the instructions. This file contains the reasoning.*

Read this before expanding, automating, reorganizing, or importing a new tool.

---

## 1. The Vault Is the Source of Truth

Markdown files in the vault are authoritative. Agent memory, chat history, staging copies, and temporary model context are derivatives. When any source conflicts with the vault, the vault wins.

## 2. Markdown Is the Medium

Alexandria must remain readable with ordinary files and folders. No database, runtime, plugin, or script should be required to understand the system.

## 3. State Describes Now. History Records the Past.

State files describe current reality and are replaced when reality changes. History files record what happened and are appended. Mixing the two creates stale state that looks authoritative.

## 4. Recoverability Over Optimization

Choose the design that can be recovered after neglect. A slower system that can be understood after six months is better than a clever system that depends on memory or perfect maintenance.

## 5. Human Fatigue Is the Operating Environment

Alexandria must survive rushed, tired, inconsistent use. If a process only works when the operator is rested and disciplined, it is too fragile.

## 6. Minimum Viable Continuity Is the Floor

`ACTIVE_CONTEXT` and `SESSION_LOG` are enough to recover operational state. Everything else adds depth, not survival. Critical state should be visible to that minimum layer.

## 7. Explicit Over Implicit

If a rule, warning, or workflow matters, write it in the vault. Shared memory, chat history, and unwritten habits do not survive context loss.

## 8. One Canonical Location Per Fact

Each important fact should have one home. Other notes may link to it, but they should not duplicate it. Duplication creates slow contradictions.

## 9. Archive Before Delete

Deletion is a one-way door. Archive first so future operators can recover the reasoning, not just the final state.

## 10. No Hidden Systems

Nothing important should run, enforce, or decide invisibly. If a system affects Alexandria, it must be discoverable from the vault.

## 11. Tools Are Temporary. Roles Are Durable.

Tools change. Roles persist. Claude, ChatGPT, Cursor, and future models are replaceable occupants of reasoning, orchestration, implementation, and memory roles. Design for the role, not the tool.

## 12. Add Only What Failure Demands

Do not add files, workflows, automations, or abstractions because they seem useful in theory. Add the smallest durable fix only after real use exposes a real failure.

## 13. Retrieval Should Be Proportional

Agents should read the smallest useful context set before acting. Under-reading causes mistakes. Over-reading causes noise. Use retrieval depth deliberately.

## 14. Errors Should Improve the System

Useful mistakes should become clearer rules, better links, or short log entries. The goal is not blame. The goal is fewer repeated failures.
