# Cline Superpowers Setup

This folder is configured for Cline with a project-local Superpowers core pack.

## Included

- `.cline/skills/` : focused Superpowers core skills for Cline inline execution.
- `.cline/skills/code-reviewer/` : inline reviewer skill.
- `.clinerules/hooks/TaskStart.ps1` : Windows hook.
- `.clinerules/hooks/TaskStart` : macOS/Linux hook (extensionless executable).
- `.clinerules/superpowers.md` : project rules to enforce skill-first workflow.
- `.clinerules/workflows/` : workflow wrappers (`brainstorm`, `write-plan`, `execute-plan`).
- `CLINE.md` : project instruction file.

## Hook behavior

TaskStart hooks read:

- `.cline/skills/using-superpowers/SKILL.md`

and returns `contextModification` so each task starts with Superpowers bootstrap context.

## What to enable in Cline

1. Open this `cline/` folder as your workspace in Cline.
2. Enable hooks (`hooks-enabled=true` in Cline settings/CLI).
3. On macOS/Linux, ensure executable bit:

```bash
chmod +x .clinerules/hooks/TaskStart
```

4. Start a new task and verify skills are discoverable from `.cline/skills`.

## No-Subagent Compatibility

Primary execution path in this branch is inline (`writing-plans` -> `executing-plans` -> `requesting-code-review` -> `code-reviewer`).
Subagents are optional and not required for this setup.
