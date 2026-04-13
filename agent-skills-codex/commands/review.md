---
description: Conduct a five-axis code review — correctness, readability, architecture, security, performance
---

Use skill: `code-review-and-quality`.

Review current changes (staged or recent commits) across five axes:

1. Correctness — spec match, edge cases, tests
2. Readability — naming, clarity, organization
3. Architecture — patterns, boundaries, abstraction level
4. Security — validation, secrets, auth (`security-and-hardening`)
5. Performance — N+1, unbounded ops (`performance-optimization`)

Categorize findings as Critical, Important, or Suggestion.
Output structured review with file:line references and recommended fixes.
