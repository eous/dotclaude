# dotclaude

Personal Claude Code configuration repository with custom agents, skills, and commands for enhanced AI-assisted development workflows.

## Tech Stack

- **Configuration**: JSON (settings.json)
- **Documentation**: Markdown (agents, skills, commands)
- **Scripting**: Bash (install.sh)
- **Target**: Claude Code CLI tool

## Project Structure

```
dotclaude/
├── agents/                    # Custom AI agents (13 total)
├── commands/                  # Slash commands (9 total)
├── skills/                    # Reusable expertise (11 total)
├── hooks/                     # Hook scripts (empty)
├── settings.json              # Global configuration
└── install.sh                 # Symlink installer
```

## Configuration (settings.json)

### Default Model
- Set to `opus` for complex reasoning tasks
- `alwaysThinkingEnabled: true` for extended thinking

### Permissions
**Auto-allowed**: `WebFetch`, `WebSearch`, common dev tools (ls, grep, git status/diff/log/branch, python, pytest, npm, cargo, make, etc.)

**Denied**: `.env` files, `secrets/` directories (protection against accidental secret exposure)

**Ask first**: `rm`, `mv`, `chmod`, `chown`, `sudo`, `git push`, `git reset`, `git rebase`

**Default mode**: `plan` (enters planning mode by default)

### Hooks
- **PostToolUse (Write|Edit)**: Auto-formats code (black/ruff for Python, prettier for JS/TS, gofmt for Go, rustfmt for Rust)
- **Notification**: Desktop notifications via notify-send (Linux) or osascript (macOS)

### Environment
- `PYTHONDONTWRITEBYTECODE=1`

## Agents

### Workflow Agents

| Agent | Model | Purpose |
|-------|-------|---------|
| `planner` | opus | Design implementation plans before coding |
| `implementer` | opus | Execute plans with production-quality code |
| `explorer` | haiku | Fast, shallow codebase exploration |
| `deep-dive` | opus | Thorough investigation of complex implementations |
| `researcher` | opus | Literature review, technology comparison |
| `debugger` | opus | Root cause analysis, systematic debugging |
| `data-scientist` | sonnet | SQL queries, data analysis, pandas operations |

### Code Review Agents

| Agent | Model | Focus |
|-------|-------|-------|
| `code-reviewer` | opus | General code quality review |
| `python-reviewer` | opus | Python idioms, typing, async patterns |
| `go-reviewer` | opus | Concurrency, error handling, interfaces |
| `rust-reviewer` | opus | Ownership, lifetimes, unsafe code |
| `cpp-reviewer` | opus | Memory safety, RAII, modern C++ |
| `pytorch-code-reviewer` | opus | ML models, training loops, GPU optimization |

## Commands

### Workflow Commands

| Command | Description |
|---------|-------------|
| `/overlord` | Full orchestrated workflow (assess → research → plan → implement → review) |
| `/plan` | Start planning phase, analyze requirements before coding |
| `/implement` | Execute implementation based on existing plan |
| `/review` | Run code review on recent changes |
| `/investigate` | Deep technical investigation of complex code |
| `/generate-memory` | Create CLAUDE.md for a project |

### TDD Commands

| Command | Description |
|---------|-------------|
| `/tdd-red` | Write failing tests first (define expected behavior) |
| `/tdd-green` | Write minimal code to make tests pass |
| `/tdd-refactor` | Improve code quality while keeping tests green |

## Skills

### Development Skills

| Skill | Description |
|-------|-------------|
| `memory-generator` | Auto-generate CLAUDE.md by exploring codebases |
| `python-best-practices` | Python patterns, conventions, type hints, async |
| `typescript-best-practices` | TypeScript patterns, generics, React TypeScript |
| `go-best-practices` | Go patterns, concurrency, error handling, interfaces |
| `rust-best-practices` | Rust ownership, lifetimes, traits, async patterns |

### Infrastructure Skills

| Skill | Description |
|-------|-------------|
| `sql-patterns` | SQL queries, optimization, indexing, schema design |
| `git-workflows` | Git branching, merging, rebasing, collaboration |
| `testing-patterns` | Unit/integration testing, mocking, fixtures, TDD |
| `api-design` | REST/GraphQL design, versioning, authentication |
| `security-checklist` | OWASP, input validation, auth, encryption |
| `docker-k8s` | Dockerfiles, compose, Kubernetes manifests, Helm |

## Installation

```bash
# Clone and install via symlinks
git clone https://github.com/YOUR_USERNAME/dotclaude.git ~/git/dotclaude
cd ~/git/dotclaude
./install.sh
```

The installer creates symlinks in `~/.claude/` with automatic backup of existing files.

## Customization

### Adding Agents
Create `agents/agent-name.md`:
```yaml
---
name: agent-name
description: What this agent does and when to use it
model: opus  # or sonnet, haiku
---

Agent system prompt here...
```

### Adding Skills
Create `skills/skill-name/SKILL.md`:
```yaml
---
name: skill-name
description: What expertise this skill provides. Include trigger terms for auto-invocation.
---

# Skill documentation and patterns...
```

### Adding Commands
Create `commands/command-name.md`:
```yaml
---
description: What this command does
---

Command instructions...
$ARGUMENTS  # User's input
```

## Notes for Claude

- This repo configures Claude Code's global behavior via `~/.claude/`
- The `hooks/` directory is empty but reserved for future hook scripts
- Agent files use YAML frontmatter for metadata, Markdown for prompts
- The install script uses symlinks, so edits to this repo apply immediately
- `settings.json` controls permissions, hooks, and environment variables
- Default mode is `plan` - Claude enters planning before implementation
- Use extended thinking triggers: "think harder" or "ultrathink" for complex problems
- TDD workflow: `/tdd-red` -> `/tdd-green` -> `/tdd-refactor` cycle
