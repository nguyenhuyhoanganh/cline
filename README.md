# Superpowers Setup

This workspace is configured with a project-local skill bundle and workflow rules.

## Included

- `.cline/skills/`: reusable skills for planning, implementation, debugging, review, and completion.
- `.clinerules/hooks/TaskStart.ps1`: Windows TaskStart hook.
- `.clinerules/hooks/TaskStart`: macOS/Linux TaskStart hook.
- `.clinerules/superpowers.md`: project rules for skill-first execution.
- `.clinerules/workflows/`: workflow wrappers (`brainstorm`, `write-plan`, `execute-plan`).
- `CLINE.md`: project instruction file.

## Hook behavior

TaskStart hooks read:

- `.cline/skills/using-superpowers/SKILL.md`

and return `contextModification` so each task starts with a skill bootstrap context.

## Default workflow

1. Brainstorm and agree on design.
2. Write an implementation plan.
3. Execute plan steps in order.
4. Run code review inline.
5. Finish the branch with explicit user choice.

## What to enable

1. Open this folder as your workspace.
2. Enable hooks (`hooks-enabled=true` in settings/CLI).
3. On macOS/Linux, ensure executable bit:

```bash
chmod +x .clinerules/hooks/TaskStart
```

4. Start a new task and verify skills are discoverable from `.cline/skills`.
