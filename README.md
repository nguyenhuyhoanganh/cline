# Cline Superpowers Setup

This repository contains validated setup branches for running Superpowers workflows in Cline.

## Option Branches

- `superpowers-core`: Lean setup, inline-first, no dependency on subagent workflow.
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

Core skills available in both options:

- `using-superpowers`: Bootstraps skill usage at task start.
- `brainstorming`: Clarifies problem and constraints before implementation.
- `writing-plans`: Turns requirements into executable task checklist.
- `executing-plans`: Executes plan tasks with verification checkpoints.
- `requesting-code-review`: Forces review checkpoints before handoff.
- `code-reviewer`: Inline reviewer role for implementation quality checks.
- `test-driven-development`: Drives RED-GREEN-REFACTOR implementation flow.
- `systematic-debugging`: Root-cause-first debugging workflow.
- `verification-before-completion`: Prevents "done" claims without evidence.

Only in `superpowers-full`:

- `dispatching-parallel-agents`
- `subagent-driven-development`
- `using-git-worktrees`
- `finishing-a-development-branch`
- `receiving-code-review`
- `writing-skills`

## Hook Behavior

TaskStart hook injects `using-superpowers` skill content into task context via `contextModification`.

Result:

- Every new task starts with Superpowers operating context.
- Skills are discoverable from `.cline/skills` without global plugin dependency.

## Workflow Usage

Typical flow:

1. `brainstorm` workflow -> decide approach.
2. `write-plan` workflow -> generate implementation plan.
3. `execute-plan` workflow -> implement with checkpoints.
4. `requesting-code-review` before final handoff.

You can call workflows directly in task prompts, for example:

- `Use workflow brainstorm for this request.`
- `Use workflow write-plan and save to docs/superpowers/plans/...`
- `Use workflow execute-plan and verify each checkpoint.`

## Cross-Platform Notes

- Windows uses `.clinerules/hooks/TaskStart.ps1`.
- macOS/Linux uses `.clinerules/hooks/TaskStart`.
- Ensure Unix hook is executable after clone:

```bash
chmod +x .clinerules/hooks/TaskStart
```

## No-Subagent Compatibility

If Cline subagents are disabled, use:

- `requesting-code-review` -> falls back to inline `code-reviewer`

This keeps review workflow usable without `use_subagents`.

## Recommended Choice

- Choose `superpowers-core` if you want minimal, stable, single-agent execution.
- Choose `superpowers-full` if you want the complete Superpowers process surface.
