---
description: Deep technical investigation of complex implementations. Use for understanding intricate code, mapping extension requirements, or planning ports/adaptations.
---

# Deep Technical Investigation

Target: $ARGUMENTS

## Instructions

Use the `deep-dive` agent for thorough technical investigation.

Unlike quick exploration, this investigation will:

1. **Trace complete code paths** - Entry point to implementation
2. **Map all dependencies** - Every file that needs to change
3. **Identify constraints** - Hard limits, soft choices, hidden assumptions
4. **Analyze extension requirements** - What's needed for new support
5. **Create implementation roadmap** - Concrete steps with dependencies

## Investigation Approach

### For "Add support for X" requests:
1. Find existing similar implementation
2. Trace how it's dispatched/selected
3. Identify what's different for new target
4. Map required changes across codebase
5. Propose implementation strategy

### For "How does X work" requests:
1. Locate entry points
2. Trace through abstraction layers
3. Document key decision points
4. Map data/control flow
5. Identify constraints and assumptions

## Output

Produce comprehensive analysis with:
- Architecture diagrams
- File change lists
- Constraint documentation
- Implementation options with trade-offs
- Concrete next steps

Begin deep investigation now.
