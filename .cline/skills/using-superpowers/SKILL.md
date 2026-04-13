---
name: using-superpowers
description: Use when starting any conversation to identify and apply the right skills before taking action.
---

# Using Superpowers

## Instruction Priority

Use this priority order:

1. User instructions (highest)
2. Workspace instructions (`CLINE.md`, `.clinerules/*`)
3. Skill instructions
4. Default model behavior

## Core Rule

Before any meaningful action, check whether one or more skills apply.

If a relevant skill exists, load it and follow it.

## Skill Discovery

- Skills live in `.cline/skills/<skill-name>/SKILL.md`.
- Read only the skill(s) needed for the current task.
- If multiple skills apply, use process skills first, then implementation skills.

## Suggested Order

- New feature or behavior change: `brainstorming` -> `writing-plans` -> `executing-plans`
- Bug or failure: `systematic-debugging` -> `test-driven-development`
- Before claiming completion: `verification-before-completion`
- Before final handoff: `requesting-code-review` -> `finishing-a-development-branch`

## Red Flags

Stop and re-check skill usage when you think:

- "I can skip this because it is simple"
- "I will gather context first and load skills later"
- "I already remember this skill"

These are usually failure paths.

## Notes

User instructions define WHAT to deliver.
Skills define HOW to execute reliably.
