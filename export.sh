#!/usr/bin/env bash
set -euo pipefail

PLATFORM="${1:-}"
EXPORT_DIR="export"

usage() {
  echo "Usage: ./export.sh <platform>"
  echo "Platforms: claude, cursor, copilot"
  exit 1
}

[[ -z "$PLATFORM" ]] && usage

case "$PLATFORM" in
  claude | cursor | copilot) ;;
  *) echo "Unknown platform: $PLATFORM"; usage ;;
esac

rm -rf "$EXPORT_DIR"

case "$PLATFORM" in
  claude)
    mkdir -p "$EXPORT_DIR/.claude/rules" "$EXPORT_DIR/.claude/commands" "$EXPORT_DIR/.claude/skills"

    cp CLAUDE.md "$EXPORT_DIR/CLAUDE.md"
    cp rules/*.md "$EXPORT_DIR/.claude/rules/"
    cp commands/*.md "$EXPORT_DIR/.claude/commands/"
    cp -r skills/* "$EXPORT_DIR/.claude/skills/"

    python3 - <<'EOF'
import json, glob

merged = {"hooks": {}}
for path in sorted(glob.glob("hooks/*.json")):
    with open(path) as f:
        data = json.load(f)
    for event, entries in data.get("hooks", {}).items():
        merged["hooks"].setdefault(event, []).extend(entries)

with open("export/.claude/settings.json", "w") as f:
    json.dump(merged, f, indent=2)
    f.write("\n")
EOF
    ;;

  cursor)
    mkdir -p "$EXPORT_DIR/.cursor/rules"
    for f in rules/*.md; do
      cp "$f" "$EXPORT_DIR/.cursor/rules/$(basename "${f%.md}.mdc")"
    done
    ;;

  copilot)
    mkdir -p "$EXPORT_DIR/.github"
    for f in rules/*.md; do
      echo "# $(basename "${f%.md}")"
      cat "$f"
      echo
    done > "$EXPORT_DIR/.github/copilot-instructions.md"
    ;;
esac

echo "Exported for $PLATFORM → $EXPORT_DIR/"
