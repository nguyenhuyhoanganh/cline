# Testing Skills

Use this guide when validating a new or edited skill.

## Objective

Prove the skill improves behavior on real tasks and remains reliable under pressure.

## Test Loop

1. Baseline run without the skill.
2. Run again with the skill.
3. Compare outputs, mistakes, and recovery behavior.
4. Update skill text to remove ambiguity.
5. Re-run until results are stable.

## Scenario Design

Good scenarios include:

- real constraints
- clear success criteria
- explicit decisions
- measurable outputs

Weak scenarios are purely academic and do not reveal failure modes.

## Capture Template

- Task
- Baseline result
- Result with skill
- Remaining gaps
- Skill patch applied
- Re-test result

## Pass Criteria

- Higher correctness than baseline
- Fewer ambiguous decisions
- Better consistency across repeated runs
- Clearer execution path

## Common Mistakes

- Testing only one easy scenario
- Accepting stylistic improvements as success
- Failing to re-test after edits
- Keeping unresolved ambiguity in instructions
