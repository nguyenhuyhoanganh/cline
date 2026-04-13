---
name: using-git-worktrees
description: Use when starting feature work that needs an isolated workspace before implementation.
---

# Using Git Worktrees

## Overview

Git worktrees provide isolated workspaces that share one repository history.

**Core principle:** choose directory deterministically, verify safety, then start from a clean baseline.

**Announce at start:** "I'm using the using-git-worktrees skill to set up an isolated workspace."

## Directory Selection Process

### 1. Check Existing Directories

```bash
ls -d .worktrees 2>/dev/null
ls -d worktrees 2>/dev/null
```

If both exist, prefer `.worktrees`.

### 2. Check Workspace Instructions

```bash
rg -n "worktree|workspace" CLINE.md .clinerules/*.md 2>/dev/null
```

If a location is specified, use it.

### 3. Ask User

If no directory exists and no preference is documented, ask where to create worktrees.

## Safety Verification

For project-local directories (`.worktrees` or `worktrees`), verify the directory is ignored:

```bash
git check-ignore -q .worktrees 2>/dev/null || git check-ignore -q worktrees 2>/dev/null
```

If not ignored:

1. Add ignore rule to `.gitignore`.
2. Commit that fix.
3. Continue with worktree creation.

For global directories outside the repo, ignore checks are not required.

## Creation Steps

### 1. Detect Project Name

```bash
project=$(basename "$(git rev-parse --show-toplevel)")
```

### 2. Create Worktree

```bash
git worktree add "$path" -b "$BRANCH_NAME"
cd "$path"
```

### 3. Run Project Setup

Run setup based on detected project files (`package.json`, `Cargo.toml`, `requirements.txt`, `pyproject.toml`, `go.mod`).

### 4. Verify Clean Baseline

Run project tests before implementation.

If tests fail, report and ask whether to continue.

### 5. Report Location

Return path and baseline status.

## Integration

Typically used before `executing-plans` and paired with `finishing-a-development-branch`.
