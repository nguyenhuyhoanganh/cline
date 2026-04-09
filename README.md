# Cline Superpowers Setup

This folder is configured for Cline with a project-local Superpowers bundle.

## Included

- `.cline/skills/` : full Superpowers skills set (14 skills).
- `.cline/skills/code-reviewer/` : inline reviewer fallback when subagents are disabled.
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

4. Start a new task and verify `superpowers` skills are discoverable from `.cline/skills`.

## No-Subagent Compatibility

If Cline subagents are disabled, use:

- `superpowers:requesting-code-review` -> falls back to inline `superpowers:code-reviewer`

This keeps review workflow usable without `use_subagents`.
