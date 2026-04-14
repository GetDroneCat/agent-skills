---
name: rb-plan
description: Wrapper lifecycle command for planning. Use when user invokes /rb-plan or $rb-plan to break a spec into small verifiable tasks with acceptance criteria and dependency ordering.
---

# RB Plan

Delegates to `/planning-and-task-breakdown` skill.

## Workflow

Read the existing spec (SPEC.md or equivalent) and the relevant codebase sections. Then:
1. Enter plan mode — read only, no code changes
2. Identify the dependency graph between components
3. Slice work vertically (one complete path per task, not horizontal layers)
4. Write tasks with acceptance criteria and verification steps
5. Add checkpoints between phases
6. Present the plan for human review

Save the plan to tasks/plan.md and task list to tasks/todo.md.