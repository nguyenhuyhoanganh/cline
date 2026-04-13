# Superpowers Setup

This repository contains validated setup branches for running Superpowers workflows.

## Option Branches

- `superpowers-core`: Lean setup, inline-first, minimal workflow surface.
- `superpowers-full`: Full Superpowers skill bundle with compatibility wiring.
- `refactor-for-cline`: Refactored sequential single-agent variant.

To use an option:

```bash
git checkout superpowers-core
# or
git checkout superpowers-full
# or
git checkout refactor-for-cline
```

## What Is Installed

- `.cline/skills/`: Project-local Superpowers skills.
- `.clinerules/hooks/TaskStart.ps1`: TaskStart hook for Windows.
- `.clinerules/hooks/TaskStart`: TaskStart hook for macOS/Linux.
- `.clinerules/superpowers.md`: Rules that enforce skill-first behavior.
- `.clinerules/workflows/`: Workflow wrappers (`brainstorm`, `write-plan`, `execute-plan`).
- `CLINE.md`: Project-level instruction priority.

## Skills Capability

Core skills available in all variants:

- `using-superpowers`
- `brainstorming`
- `writing-plans`
- `executing-plans`
- `requesting-code-review`
- `code-reviewer`
- `test-driven-development`
- `systematic-debugging`
- `verification-before-completion`

Additional skills in `superpowers-full`:

- `dispatching-parallel-agents`
- `subagent-driven-development`
- `using-git-worktrees`
- `finishing-a-development-branch`
- `receiving-code-review`
- `writing-skills`

## Hook Behavior

TaskStart hooks load `.cline/skills/using-superpowers/SKILL.md` and inject it via `contextModification`.

Result:

- Every new task starts with Superpowers operating context.
- Skills are discoverable from `.cline/skills` without global plugin dependency.

## Default Workflow

1. `brainstorm` workflow -> decide approach.
2. `write-plan` workflow -> generate implementation plan.
3. `execute-plan` workflow -> implement with checkpoints.
4. `requesting-code-review` before final handoff.

## Setup

1. Open this folder as your workspace.
2. Enable hooks (`hooks-enabled=true` in settings/CLI).
3. On macOS/Linux, ensure Unix hook is executable:

```bash
chmod +x .clinerules/hooks/TaskStart
```

4. Start a new task and verify skills are discoverable from `.cline/skills`.

## No-Subagent Compatibility

If subagents are disabled, use:

- `requesting-code-review` -> falls back to inline `code-reviewer`

This keeps review workflow usable without `use_subagents`.

## Recommended Choice

- Choose `superpowers-core` for minimal, stable, single-agent execution.
- Choose `superpowers-full` for the complete Superpowers process surface.
- Choose `refactor-for-cline` for streamlined sequential execution.
