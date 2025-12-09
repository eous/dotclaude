---
description: Full orchestrated workflow - assess, research, plan, implement, review. Coordinates multiple agents through a complete development cycle.
---

# Overlord Workflow

Task: $ARGUMENTS

You are coordinating a full development workflow. Execute these phases in order, using specialized agents at each step.

## Phase 1: Assessment

Analyze the task and determine:
1. **Complexity**: Simple fix, feature, or architectural change?
2. **Research needed**: Is this a known pattern or does it require investigation?
3. **Scope**: Which parts of the codebase are affected?

If research is needed (new technology, unfamiliar domain, best practices unclear):
- Use the `researcher` agent to gather information
- Summarize findings before proceeding

## Phase 2: Planning

Use the `planner` agent to:
1. Investigate the codebase
2. Design the implementation approach
3. Break down into concrete steps
4. Identify risks and dependencies

**STOP AND WAIT FOR USER APPROVAL BEFORE PROCEEDING**

Present the plan clearly and ask: "Ready to proceed with implementation?"

## Phase 3: Implementation

After plan approval, use the `implementer` agent to:
1. Execute the plan step by step
2. Track progress with the todo list
3. Make incremental, testable changes
4. Run tests after each significant change

### Review Gates

Trigger a review after:
- [ ] Core functionality is complete
- [ ] All planned changes are implemented
- [ ] Before any commit

Use the appropriate reviewer:
- Python code → `python-reviewer`
- Go code → `go-reviewer`
- Rust code → `rust-reviewer`
- C/C++ code → `cpp-reviewer`
- PyTorch/ML code → `pytorch-code-reviewer`
- General/mixed → `code-reviewer`

## Phase 4: Completion

After implementation and review:
1. Summarize what was accomplished
2. List any follow-up tasks or technical debt
3. Confirm tests pass
4. Ask if user wants to commit

## Workflow Rules

- **Never skip phases** - Each phase builds on the previous
- **Always wait for approval** after planning phase
- **Track progress** - Use TodoWrite throughout
- **Be explicit** - Announce which phase/agent you're using
- **Handle blockers** - If stuck, explain why and ask for guidance

## Phase Announcements

Use these markers to make workflow progress clear:

```
═══════════════════════════════════════
📋 PHASE 1: ASSESSMENT
═══════════════════════════════════════

═══════════════════════════════════════
🔬 PHASE 1.5: RESEARCH (if needed)
═══════════════════════════════════════

═══════════════════════════════════════
📐 PHASE 2: PLANNING
═══════════════════════════════════════

⏸️  AWAITING APPROVAL - Review the plan above

═══════════════════════════════════════
🔨 PHASE 3: IMPLEMENTATION
═══════════════════════════════════════

═══════════════════════════════════════
🔍 REVIEW GATE
═══════════════════════════════════════

═══════════════════════════════════════
✅ PHASE 4: COMPLETION
═══════════════════════════════════════
```

Begin with Phase 1: Assessment.
