---
description: Implement the next task incrementally — build, test, verify, commit
---

Use skills: `incremental-implementation` + `test-driven-development`.

Pick the next pending task from the plan. For each task:

1. Read acceptance criteria
2. Load relevant context (existing code, patterns, types)
3. Write a failing test for expected behavior (RED)
4. Implement minimum code to pass the test (GREEN)
5. Run full test suite for regressions
6. Run build to verify compilation
7. Commit with a descriptive message
8. Mark task complete and move to next

If any step fails, use `debugging-and-error-recovery`.
