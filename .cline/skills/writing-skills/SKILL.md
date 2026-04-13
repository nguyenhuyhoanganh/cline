---
name: writing-skills
description: Use when creating or updating a skill and you need a repeatable quality process before publishing.
---

# Writing Skills

## Overview

Write skills as operational documentation: discoverable, concise, testable, and reusable.

## What a Skill Is

A skill is a practical guide for repeated work:

- technique
- pattern
- reference

A skill is not a one-off story.

## Directory Structure

```text
skills/
  skill-name/
    SKILL.md
    optional-supporting-files
```

## SKILL.md Baseline

Include YAML frontmatter:

```yaml
---
name: skill-name
description: Use when [clear trigger conditions]
---
```

Then include:

1. Overview
2. When to Use
3. Process or Pattern
4. Verification checklist
5. Common mistakes

## Authoring Rules

- Keep instructions concrete.
- Use explicit triggers in `description`.
- Prefer one strong example over many weak examples.
- Split heavy reference into separate files.
- Avoid placeholder text (TODO/TBD).

## Testing Workflow

Before publishing or editing a skill:

1. Run baseline without the skill.
2. Apply the skill and re-run the same task.
3. Compare quality and consistency.
4. Capture failure patterns and patch the skill.
5. Re-test until stable.

See `testing-skills.md` for the full test format.

## Quick Checklist

- [ ] Description clearly signals when to load the skill.
- [ ] Process steps are actionable.
- [ ] Verification steps are explicit.
- [ ] References are one level deep from `SKILL.md`.
- [ ] The skill was tested with realistic tasks.

## Related References

- `testing-skills.md`
- `anthropic-best-practices.md`
- `graphviz-conventions.dot`
