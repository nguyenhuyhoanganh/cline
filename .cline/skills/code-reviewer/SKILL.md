---
name: code-reviewer
description: Use when an inline production-readiness review is needed for a defined commit range.
---

# Code Reviewer

Run a production-focused review in the current session.

## Inputs

- `WHAT_WAS_IMPLEMENTED`
- `PLAN_OR_REQUIREMENTS`
- `BASE_SHA`
- `HEAD_SHA`
- `DESCRIPTION`

If values are missing, derive them first:

```bash
BASE_SHA=$(git rev-parse HEAD~1)
HEAD_SHA=$(git rev-parse HEAD)
```

## Review Procedure

1. Inspect change scope:

```bash
git diff --stat {BASE_SHA}..{HEAD_SHA}
git diff {BASE_SHA}..{HEAD_SHA}
```

2. Evaluate:

- Correctness and regressions
- Architecture and maintainability
- Test quality and coverage
- Security and reliability
- Requirement compliance

3. Categorize findings:

- Critical
- Important
- Minor

4. Provide merge assessment:

- `Ready to merge: Yes / No / With fixes`

## Output Format

### Strengths

[Specific strengths]

### Issues

#### Critical (Must Fix)

[or `None`]

#### Important (Should Fix)

[or `None`]

#### Minor (Nice to Have)

[or `None`]

For each issue include:

- File:line
- Problem
- Why it matters
- Fix direction

### Recommendations

[Optional process or design improvements]

### Assessment

**Ready to merge?** [Yes/No/With fixes]

**Reasoning:** [1-2 sentences]
