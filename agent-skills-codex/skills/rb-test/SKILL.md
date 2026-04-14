---
name: rb-test
description: Wrapper lifecycle command for test-first verification. Use when user invokes /rb-test or $rb-test to run TDD workflow — write failing tests, implement, verify. For bugs, use the Prove-It pattern.
---

# RB Test

Delegates to `/test-driven-development` skill.

## Workflow

For new features:
1. Write tests that describe the expected behavior (they should FAIL)
2. Implement the code to make them pass
3. Refactor while keeping tests green

For bug fixes (Prove-It pattern):
1. Write a test that reproduces the bug (must FAIL)
2. Confirm the test fails
3. Implement the fix
4. Confirm the test passes
5. Run the full test suite for regressions

For browser-related issues, also invoke agent-skills:browser-testing-with-devtools to verify with Chrome DevTools MCP.