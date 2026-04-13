---
name: executing-plans
description: Use when you have a written implementation plan and need to execute it step-by-step with checkpoints.
---

# Executing Plans

## Overview

Load the plan, review it critically, execute tasks in order, and report completion with verification evidence.

**Announce at start:** "I'm using the executing-plans skill to implement this plan."

## The Process

### Step 1: Load and Review Plan

1. Read the plan file.
2. Validate assumptions and dependencies.
3. Raise blockers or contradictions before coding.
4. Create a task checklist and proceed.

### Step 2: Execute Tasks

For each task:

1. Mark as in progress.
2. Follow each step exactly.
3. Run required verification commands.
4. Mark complete only after successful verification.

### Step 3: Complete Development

After all tasks are complete and verified:

- Announce: "I'm using the finishing-a-development-branch skill to complete this work."
- Use `finishing-a-development-branch`.

## When to Stop and Ask for Help

Stop immediately when:

- A dependency is missing.
- A plan step is ambiguous.
- Verification fails repeatedly.
- The plan no longer matches repository reality.

Ask for clarification instead of guessing.

## Remember

- Review first.
- Execute in order.
- Do not skip verification.
- Do not start implementation on `main`/`master` without explicit approval.

## Integration

Required workflow skills:

- `using-git-worktrees`
- `writing-plans`
- `finishing-a-development-branch`
