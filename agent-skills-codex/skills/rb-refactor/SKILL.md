---
name: rb-refactor
description: Wrapper lifecycle command for code refactoring. Use when user invokes /rb-refactor or $rb-refactor to simplify code for clarity and maintainability — reduce complexity without changing behavior
---

# RB Refactor

Delegates to `/code-simplification` skill.

## Workflow

Simplify recently changed code (or specified scope) while preserving behavior:

1. Read project conventions (`AGENTS.md` and local docs)
2. Identify target code
3. Understand purpose, callers, edge cases, and tests before editing
4. Find opportunities:
   - Deep nesting -> guard clauses/helpers
   - Long functions -> split by responsibility
   - Nested ternaries -> clearer conditionals
   - Generic names -> descriptive names
   - Duplicated logic -> shared functions
   - Dead code -> remove when safe
5. Apply changes incrementally and run tests after each
6. Verify tests pass, build succeeds, and diff is clean

If tests fail after simplification, revert that step and reconsider.
