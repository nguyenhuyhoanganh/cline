# Cline Tool Mapping

Skills in this project are authored for Cline directly.

## Core Invocation Tools

| Skill reference | Cline equivalent |
|-----------------|------------------|
| `Skill` tool | `use_skill` |
| `Task` tool (parallel research) | `use_subagents` |
| `TodoWrite` style checklist tracking | Focus Chain todo list + markdown checklist updates |
| "Create a fresh continuation task" | `new_task` |

## Subagent Constraints (Cline)

Subagents are read-only research workers. They can:
- `read_file`
- `list_files`
- `search_files`
- `list_code_definition_names`
- `execute_command` (read-only commands)
- `use_skill`

They cannot:
- write or patch files
- use browser tools
- access MCP servers
- spawn nested subagents

Design skills so implementation remains controller-owned.

## Future Capability Gates

This repository keeps a capability-gated multi-agent architecture:
- **Gate 1:** Cline tooling support (official write-capable subagent capability).
- **Gate 2:** Project governance enablement (`CLINE.md` / `.clinerules/*` explicit opt-in).

Until both gates are true:
- keep implementation controller-owned
- use subagents for research/review only

When both gates are true:
- activate write-capable subagent lanes with explicit file ownership, merge policy, and mandatory two-stage review gates.

## Workflow and Planning Features

Use these Cline-native capabilities when a skill references structured execution:
- **Workflows** via `.clinerules/workflows/*.md` and slash invocation (`/workflow-name.md`)
- **Focus Chain** for persistent task checklist tracking
- **Deep Planning** (`/deep-planning`) for architecture-grade plan generation into `implementation_plan.md`
- **Plan & Act mode** for explicit planning/execution transitions

## Hook Integration Points

Hooks can enforce and enrich skill behavior:
- `TaskStart` / `TaskResume` for context bootstrap
- `PreToolUse` for safety gating and parameter validation
- `PostToolUse` for telemetry and result validation
- `TaskComplete` for final verification gates
- `PreCompact` for context archival and memory updates before compaction

Hook output contract:
- `cancel`: block or allow
- `contextModification`: inject guidance/context
- `errorMessage`: surfaced when blocked

## Architecture Guidance

When translating process-heavy skills to Cline:
1. Keep orchestration and quality gates explicit.
2. Use subagents only for parallel evidence gathering and review passes.
3. Keep code edits, tests, commits, and branch operations in the main agent flow.
4. Preserve plan/checklist state in Focus Chain and memory artifacts.
