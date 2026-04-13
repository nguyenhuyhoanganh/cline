---
name: requesting-code-review
description: Use when finishing meaningful implementation work and you need an inline code review before final handoff.
---

# Requesting Code Review

Use `code-reviewer` to catch issues before they compound.

**Core principle:** review before merge or final handoff.

## When to Request Review

Mandatory:

- After completing major changes
- Before branch completion

Optional:

- When stuck and needing a second pass
- After risky refactors
- After complex bug fixes

## How to Request

1. Get commit range:

```bash
BASE_SHA=$(git rev-parse HEAD~1)
HEAD_SHA=$(git rev-parse HEAD)
```

2. Run `code-reviewer` inline with these inputs:

- `WHAT_WAS_IMPLEMENTED`
- `PLAN_OR_REQUIREMENTS`
- `BASE_SHA`
- `HEAD_SHA`
- `DESCRIPTION`

3. Act on findings:

- Fix Critical issues immediately.
- Fix Important issues before completion.
- Track Minor issues explicitly.

## Red Flags

Never:

- Skip review because work looks simple.
- Ignore Critical issues.
- Claim readiness without a clear assessment.

See template at: `requesting-code-review/code-reviewer.md`.
