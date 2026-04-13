# Execute Plan Workflow

Use skill `executing-plans` or `subagent-driven-development`.

Then:

1. Execute tasks in order with checkpoints.
2. Run verification after each meaningful change.
3. Trigger `requesting-code-review` before final handoff.
4. Apply capability gate: default to controller-owned implementation with read-only subagents; only switch to write-capable subagent lane when tooling support and governance enablement are both explicit.
