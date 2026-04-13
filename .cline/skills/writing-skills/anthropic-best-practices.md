# Skill Authoring Best Practices

This reference summarizes practical skill-authoring guidance for this repository.

## Core Principles

- Keep content concise.
- Make trigger conditions explicit.
- Use progressive disclosure for large references.
- Keep examples concrete and runnable.
- Prefer deterministic scripts for repetitive operations.

## Structure Guidance

Use `SKILL.md` as a navigation layer:

- core workflow in SKILL.md
- heavy API/reference in separate files
- executable helpers under `scripts/`

## Quality Guidance

- include verification steps for every critical workflow
- document assumptions and limits
- avoid hidden dependencies
- avoid nested reference chains

## Validation Guidance

- test with realistic tasks
- record before/after behavior
- update skill text to remove ambiguity
- rerun validation after every meaningful edit

## Publishing Checklist

- [ ] clear frontmatter (`name`, `description`)
- [ ] explicit "when to use"
- [ ] practical process steps
- [ ] verification and failure handling
- [ ] at least one realistic validation run
