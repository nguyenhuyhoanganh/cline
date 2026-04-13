# Cline Superpowers Setup

This repository contains a full Superpowers workflow surface for Cline, including planning, execution, verification, review, and capability-gated multi-agent orchestration.

## Full Feature Surface

- Skill-first orchestration bootstrapped from TaskStart hook.
- End-to-end delivery flow: brainstorming -> plan writing -> plan execution -> review -> branch finishing.
- Verification discipline: TDD workflow, systematic debugging, and verification-before-completion gates.
- Behavioral guardrails for coding tasks via Karpathy guidelines: explicit assumptions, simplicity-first changes, surgical diffs, and verifiable outcomes.
- Capability-gated multi-agent architecture:
  - active lane: controller-owned implementation + read-only subagent research/review
  - future lane: reserved write-capable subagent lane behind explicit tooling + governance gates
- Structured review system: spec compliance gate, code quality gate, and final integration review.
- Worktree-safe development flow and branch completion workflow.
- Skill authoring/hardening workflows for maintaining process quality over time.

## What Is Installed

- `.cline/skills/`: Project-local Superpowers skills.
- `.clinerules/hooks/TaskStart.ps1`: TaskStart hook for Windows.
- `.clinerules/hooks/TaskStart`: TaskStart hook for macOS/Linux.
- `.clinerules/superpowers.md`: Rules that enforce skill-first behavior.
- `.clinerules/workflows/`: Workflow wrappers (`brainstorm`, `write-plan`, `execute-plan`).
- `CLINE.md`: Project-level instruction priority.

## Skills Capability

Core skills in this branch:

- `using-superpowers`: Bootstraps skill usage at task start.
- `karpathy-guidelines`: Behavioral guardrails to reduce overcomplication and keep code changes scoped and verifiable.
- `brainstorming`: Clarifies problem and constraints before implementation.
- `writing-plans`: Turns requirements into executable task checklist.
- `executing-plans`: Executes plan tasks with verification checkpoints.
- `requesting-code-review`: Forces review checkpoints before handoff.
- `code-reviewer`: Inline reviewer role for implementation quality checks.
- `test-driven-development`: Drives RED-GREEN-REFACTOR implementation flow.
- `systematic-debugging`: Root-cause-first debugging workflow.
- `verification-before-completion`: Prevents "done" claims without evidence.
- `dispatching-parallel-agents`: Parallel read-only research orchestration.
- `subagent-driven-development`: Capability-gated multi-agent workflow with controller-owned implementation.
- `using-git-worktrees`: Isolated workspace setup for branch-safe execution.
- `finishing-a-development-branch`: Structured completion and integration options.
- `receiving-code-review`: Technical review intake and validation workflow.
- `writing-skills`: Skill authoring and hardening workflow.

## Hook Behavior

TaskStart hook injects `using-superpowers` skill content into task context via `contextModification`.

Result:

- Every new task starts with Superpowers operating context.
- Skills are discoverable from `.cline/skills` without global plugin dependency.

## Workflow Usage

Typical flow:

1. `brainstorm` workflow -> decide approach.
2. `write-plan` workflow -> generate implementation plan.
3. `execute-plan` workflow -> implement with checkpoints.
4. `requesting-code-review` before final handoff.

You can call workflows directly in task prompts, for example:

- `Use workflow brainstorm for this request.`
- `Use workflow write-plan and save to docs/superpowers/plans/...`
- `Use workflow execute-plan and verify each checkpoint.`

## Cross-Platform Notes

- Windows uses `.clinerules/hooks/TaskStart.ps1`.
- macOS/Linux uses `.clinerules/hooks/TaskStart`.
- Ensure Unix hook is executable after clone:

```bash
chmod +x .clinerules/hooks/TaskStart
```

## No-Subagent Compatibility

If Cline subagents are disabled, use:

- `requesting-code-review` -> falls back to inline `code-reviewer`

This keeps review workflow usable without `use_subagents`.

## Simplified Option

If you want a lean, simplified setup:

- `superpowers-core`: inline-first execution profile with reduced process surface.

```bash
git checkout superpowers-core
```
