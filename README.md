# dotclaude

Personal Claude Code configuration with custom agents, skills, and commands.

## Overview

This repository contains my global Claude Code customizations for enhanced AI-assisted development workflows.

## Structure

```
dotclaude/
├── settings.json              # Global settings (model, hooks, permissions)
├── agents/                    # Custom AI agents
│   ├── planner.md             # Architecture planning (opus)
│   ├── implementer.md         # Code implementation (opus)
│   ├── explorer.md            # Fast codebase exploration (haiku)
│   ├── deep-dive.md           # Deep technical investigation (opus)
│   ├── researcher.md          # Literature/web research (opus)
│   ├── code-reviewer.md       # General code review (opus)
│   ├── python-reviewer.md     # Python-specific review (opus)
│   ├── go-reviewer.md         # Go-specific review (opus)
│   ├── rust-reviewer.md       # Rust-specific review (opus)
│   ├── cpp-reviewer.md        # C/C++-specific review (opus)
│   └── pytorch-code-reviewer.md  # PyTorch/ML review (opus)
├── skills/                    # Reusable expertise
│   ├── python-best-practices/ # Python patterns and conventions
│   └── memory-generator/      # Auto-generate CLAUDE.md for projects
├── commands/                  # Custom slash commands
│   ├── plan.md                # /plan - Start planning phase
│   ├── implement.md           # /implement - Execute implementation
│   ├── review.md              # /review - Run code review
│   ├── investigate.md         # /investigate - Deep technical investigation
│   └── generate-memory.md     # /generate-memory - Create project CLAUDE.md
└── hooks/                     # Hook scripts (if any)
```

## Agents

### Workflow Agents

| Agent | Model | Purpose |
|-------|-------|---------|
| `planner` | opus | Design implementation plans before coding |
| `implementer` | opus | Execute plans with production-quality code |
| `explorer` | haiku | Fast, shallow codebase exploration |
| `deep-dive` | opus | Thorough investigation of complex implementations |
| `researcher` | opus | Literature review, technology comparison |

### Code Review Agents

| Agent | Model | Focus |
|-------|-------|-------|
| `code-reviewer` | opus | General code quality review |
| `python-reviewer` | opus | Python idioms, typing, async patterns |
| `go-reviewer` | opus | Concurrency, error handling, interfaces |
| `rust-reviewer` | opus | Ownership, lifetimes, unsafe code |
| `cpp-reviewer` | opus | Memory safety, RAII, modern C++ |
| `pytorch-code-reviewer` | opus | ML models, training loops, GPU optimization |

## Installation

### Quick Install (Symlink)

```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/dotclaude.git ~/git/dotclaude

# Run install script
cd ~/git/dotclaude
./install.sh
```

### Manual Install (Copy)

```bash
# Copy files to ~/.claude/
cp settings.json ~/.claude/
cp -r agents/* ~/.claude/agents/
cp -r skills/* ~/.claude/skills/
cp -r commands/* ~/.claude/commands/
```

## Configuration Highlights

### Default Model
- Set to `opus` for complex reasoning tasks

### Hooks
- **PostToolUse**: Reminds to run `/review` after file modifications
- **Stop**: Evaluates if code review is needed before finishing

### Permissions
- Auto-allowed: Common dev tools (git status/diff/log, python, pytest, npm, cargo, etc.)
- Ask first: Destructive operations (rm, mv, git push/reset/rebase)

## Usage

### Workflow Commands

```bash
# Start with planning
/plan Add user authentication to the API

# Execute the plan
/implement

# Review the code
/review src/auth/

# Deep investigation for complex tasks
/investigate How to add sm_120 support to the nvfp4 implementation
```

### Generate Project Memory

```bash
# Create CLAUDE.md for a new project
/generate-memory
```

## Customization

### Adding New Agents

Create a new file in `agents/`:

```yaml
---
name: my-agent
description: What this agent does and when to use it
model: opus  # or sonnet, haiku
---

Your agent's system prompt here...
```

### Adding New Skills

Create `skills/skill-name/SKILL.md`:

```yaml
---
name: skill-name
description: What expertise this skill provides
---

# Skill documentation and patterns...
```

### Adding New Commands

Create `commands/command-name.md`:

```yaml
---
description: What this command does
---

# Command instructions...

$ARGUMENTS  # User's input
```

## License

MIT
