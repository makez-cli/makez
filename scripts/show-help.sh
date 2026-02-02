#!/bin/bash

MAKEFILE_DIR="$1"
PLUGINS_DIR="$HOME/.makez/plugins"

echo ""
echo "  MakeZ - Your automation toolbox"
echo "  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Core commands (from makefiles/*.mk and Makefile, excluding plugin-* commands)
echo "Core Commands:"
grep -hE '^[a-zA-Z_-]+:.*?## .*$$' "$MAKEFILE_DIR"Makefile "$MAKEFILE_DIR"makefiles/*.mk 2>/dev/null | \
  grep -v '^plugin-' | \
  sort | \
  awk 'BEGIN {FS = ":.*?## "}; {printf "  %-18s %s\n", $1, $2}'
echo ""

# Plugin management commands
echo "Plugin Management:"
grep -hE '^plugin-[a-zA-Z_-]+:.*?## .*$$' "$MAKEFILE_DIR"makefiles/plugins.mk 2>/dev/null | \
  sort | \
  awk 'BEGIN {FS = ":.*?## "}; {printf "  %-18s %s\n", $1, $2}'
echo ""

# Installed plugins
if [ -d "$PLUGINS_DIR" ] && [ -n "$(ls -A $PLUGINS_DIR 2>/dev/null | grep -v '^\.registry$')" ]; then
    echo "Installed Plugins:"
    for plugin_dir in "$PLUGINS_DIR"/*; do
        [ ! -d "$plugin_dir" ] && continue
        plugin_name=$(basename "$plugin_dir")

        echo "  $plugin_name:"

        plugin_mk="$plugin_dir/plugin.mk"
        if [ -f "$plugin_mk" ]; then
            grep -hE '^[a-zA-Z_-]+:.*?## .*$$' "$plugin_mk" | \
              sort | \
              awk 'BEGIN {FS = ":.*?## "}; {printf "    %-16s %s\n", $1, $2}'
        fi
    done
    echo ""
fi

echo "  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Usage: makez <command>"
echo "  Add your own commands in makefiles/*.mk"
echo ""
