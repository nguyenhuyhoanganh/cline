---
name: receiving-code-review
description: Use when receiving review feedback and you must verify technical validity before implementing changes.
---

# Code Review Reception

## Overview

Review feedback is technical input, not an instruction to apply blindly.

**Core principle:** verify before implementing.

## The Response Pattern

1. Read complete feedback.
2. Restate requirements in concrete terms.
3. Verify against current code and behavior.
4. Evaluate technical correctness for this codebase.
5. Respond with acceptance or reasoned pushback.
6. Implement one item at a time with tests.

## Forbidden Responses

Never start with performative agreement.

Do this instead:

- restate technical requirement,
- ask clarifying questions,
- implement directly after verification.

## Handling Unclear Feedback

If any item is unclear, stop and request clarification before implementing any item.

## Source-Specific Handling

### From your human partner

- Trusted source
- Still clarify unclear scope
- Move quickly to implementation

### From external reviewers

Before implementing, check:

1. Is it technically correct here?
2. Will it break existing behavior?
3. Is there context the reviewer may not have?
4. Does it conflict with prior architectural decisions?

If uncertain, state limits and ask for direction.

## Implementation Order

1. Clarify unclear items first.
2. Fix blocking issues.
3. Fix simple items.
4. Fix complex items.
5. Test each change and confirm no regressions.

## Acknowledging Correct Feedback

Use factual acknowledgments:

- "Fixed: ..."
- "Verified and fixed in ..."

Avoid excessive social phrasing; show outcome in code and tests.

## Bottom Line

Feedback is evaluated, then implemented.

No blind agreement, no blind rejection.
