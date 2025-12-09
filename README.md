# dotclaude

Personal Claude Code configuration with custom agents, skills, and commands.

## Quick Start

```bash
# Clone and install
git clone https://github.com/YOUR_USERNAME/dotclaude.git ~/git/dotclaude
cd ~/git/dotclaude
./install.sh

# Restart Claude Code to apply changes
```

The installer creates symlinks to `~/.claude/`, so edits to this repo apply immediately.

## What's Included

| Component | Count | Highlights |
|-----------|-------|------------|
| **Agents** | 13 | `planner`, `implementer`, `debugger`, `data-scientist`, code reviewers |
| **Commands** | 9 | `/overlord`, `/plan`, `/implement`, `/review`, `/tdd-red`, `/tdd-green`, `/tdd-refactor` |
| **Skills** | 11 | `python-best-practices`, `typescript-best-practices`, `go-best-practices`, `rust-best-practices`, `sql-patterns`, `git-workflows`, `testing-patterns`, `api-design`, `security-checklist`, `docker-k8s`, `memory-generator` |
| **Hooks** | 2 | Auto-formatting, desktop notifications |

## Key Features

- **Default model**: `opus` with extended thinking enabled
- **Auto-formatting**: Python (black/ruff), JS/TS (prettier), Go (gofmt), Rust (rustfmt)
- **Secret protection**: Denies access to `.env` files and `secrets/` directories
- **Plan-first workflow**: Defaults to planning mode before implementation
- **TDD support**: Red-green-refactor cycle via slash commands

## Documentation

See [CLAUDE.md](CLAUDE.md) for full documentation including:
- Complete agent and command reference
- Configuration details
- Customization guide

## License

MIT
