---
name: rb-review
description: Wrapper lifecycle command for structured review. Use when user invokes /rb-review or $rb-review to conduct a five-axis code review — correctness, readability, architecture, security, performance
---

# RB Review

Delegates to `/code-review-and-quality` skill.

## Workflow

Review current changes (staged or recent commits) across five axes:

1. Correctness — spec match, edge cases, tests
2. Readability — naming, clarity, organization
3. Architecture — patterns, boundaries, abstraction level
4. Security — validation, secrets, auth (`/security-and-hardening` skill)
5. Performance — N+1, unbounded ops (`/performance-optimization` skill)

Categorize findings as Critical, Important, or Suggestion.
Output structured review with file:line references and recommended fixes.
