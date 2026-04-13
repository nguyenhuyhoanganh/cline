---
name: finishing-a-development-branch
description: Use when implementation is complete and you need to finalize the branch with an explicit user choice.
---

# Finishing a Development Branch

## Overview

Complete development with explicit options: verify tests, present choices, execute selected path, clean up safely.

**Announce at start:** "I'm using the finishing-a-development-branch skill to complete this work."

## The Process

### Step 1: Verify Tests

Run the project test command before presenting any option.

If tests fail, stop and report failures.

### Step 2: Determine Base Branch

Use merge-base to detect likely target branch (`main` or `master`) and confirm if needed.

### Step 3: Present Options

Present exactly these options:

1. Merge back to `<base-branch>` locally
2. Push and create a Pull Request
3. Keep the branch as-is
4. Discard this work

### Step 4: Execute Choice

#### Option 1: Merge Locally

- Checkout base branch
- Pull latest
- Merge feature branch
- Re-run tests
- Delete merged feature branch

#### Option 2: Push and Create PR

- Push branch
- Create PR with summary and test plan
- Keep branch/worktree by default

#### Option 3: Keep As-Is

- Report current branch and path
- Do not clean up

#### Option 4: Discard

- Show irreversible impact
- Require exact typed confirmation `discard`
- Delete branch only after confirmation

### Step 5: Cleanup Worktree

Cleanup for options 1 and 4.

For option 2, keep worktree unless user asks to remove it.
For option 3, keep worktree.

## Red Flags

Never:

- Proceed while tests fail
- Delete work without explicit confirmation
- Force-push without explicit request

Always:

- Verify tests before decisions
- Show explicit options
- Require confirmation for destructive actions

## Integration

Usually called after `executing-plans` and paired with `using-git-worktrees`.
