#!/bin/bash
# Install dotclaude configuration to ~/.claude/

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="$HOME/.claude"

echo "Installing dotclaude configuration..."

# Create directories if they don't exist
mkdir -p "$CLAUDE_DIR/agents"
mkdir -p "$CLAUDE_DIR/skills"
mkdir -p "$CLAUDE_DIR/commands"
mkdir -p "$CLAUDE_DIR/hooks"

# Function to install with backup
install_file() {
    src="$1"
    dest="$2"

    if [ -f "$dest" ] && [ ! -L "$dest" ]; then
        echo "  Backing up existing: $dest -> $dest.bak"
        mv "$dest" "$dest.bak"
    fi

    if [ -L "$dest" ]; then
        rm "$dest"
    fi

    echo "  Installing: $dest"
    ln -s "$src" "$dest"
}

# Install settings.json
install_file "$SCRIPT_DIR/settings.json" "$CLAUDE_DIR/settings.json"

# Install agents
echo "Installing agents..."
for agent in "$SCRIPT_DIR/agents"/*.md; do
    if [ -f "$agent" ]; then
        name=$(basename "$agent")
        install_file "$agent" "$CLAUDE_DIR/agents/$name"
    fi
done

# Install skills
echo "Installing skills..."
for skill_dir in "$SCRIPT_DIR/skills"/*/; do
    if [ -d "$skill_dir" ]; then
        skill_name=$(basename "$skill_dir")
        mkdir -p "$CLAUDE_DIR/skills/$skill_name"
        for file in "$skill_dir"*; do
            if [ -f "$file" ]; then
                name=$(basename "$file")
                install_file "$file" "$CLAUDE_DIR/skills/$skill_name/$name"
            fi
        done
    fi
done

# Install commands
echo "Installing commands..."
for cmd in "$SCRIPT_DIR/commands"/*.md; do
    if [ -f "$cmd" ]; then
        name=$(basename "$cmd")
        install_file "$cmd" "$CLAUDE_DIR/commands/$name"
    fi
done

# Install hooks
echo "Installing hooks..."
for hook in "$SCRIPT_DIR/hooks"/*.sh; do
    if [ -f "$hook" ]; then
        name=$(basename "$hook")
        install_file "$hook" "$CLAUDE_DIR/hooks/$name"
        chmod +x "$CLAUDE_DIR/hooks/$name"
    fi
done

echo ""
echo "Installation complete!"
echo ""
echo "Installed:"
echo "  - settings.json"
echo "  - $(ls -1 "$SCRIPT_DIR/agents"/*.md 2>/dev/null | wc -l) agents"
echo "  - $(ls -1d "$SCRIPT_DIR/skills"/*/ 2>/dev/null | wc -l) skills"
echo "  - $(ls -1 "$SCRIPT_DIR/commands"/*.md 2>/dev/null | wc -l) commands"
echo "  - $(ls -1 "$SCRIPT_DIR/hooks"/*.sh 2>/dev/null | wc -l) hooks"
echo ""
echo "Restart Claude Code to apply changes."
