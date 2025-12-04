---
description: Generate a CLAUDE.md memory file for the current project by exploring its structure, patterns, and conventions.
---

# Generate Project Memory

Explore and analyze this codebase to generate a comprehensive CLAUDE.md file.

Target: $ARGUMENTS

## Instructions

Use the `memory-generator` skill to:

1. **Explore the project structure**
   - Map directories and key files
   - Identify entry points
   - Detect technology stack

2. **Analyze patterns and conventions**
   - Code organization
   - Naming conventions
   - Testing patterns

3. **Review existing documentation**
   - README content
   - API docs
   - Contributing guides

4. **Generate CLAUDE.md**
   - Create comprehensive project context
   - Include development commands
   - Document key patterns and conventions

## Output Options

After exploration, ask the user where to save:
- `./CLAUDE.md` - Project root (recommended, version controlled)
- `./.claude/CLAUDE.md` - Claude-specific directory
- `./CLAUDE.local.md` - Private/personal notes (gitignored)

## Process

1. Start exploration with basic structure analysis
2. Detect language, framework, and dependencies
3. Sample key files to understand patterns
4. Review existing documentation
5. Generate comprehensive CLAUDE.md
6. Present to user for review and refinement

Begin exploration now.
