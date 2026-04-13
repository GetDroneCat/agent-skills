---
description: Run TDD workflow — write failing tests, implement, verify. For bugs, use Prove-It pattern.
---

Use skill: `test-driven-development`.

For new features:
1. Write tests that describe expected behavior (must fail)
2. Implement code to pass tests
3. Refactor while keeping tests green

For bug fixes (Prove-It):
1. Write test that reproduces bug (must fail)
2. Confirm failure
3. Implement fix
4. Confirm pass
5. Run full suite for regressions

For browser-related issues, also use `browser-testing-with-devtools`.
