#!/bin/bash
set -e

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SOURCE_CONFIG="$SCRIPT_DIR/karabiner.json"
TARGET_CONFIG="$HOME/.config/karabiner/karabiner.json"

echo "Copying config from $SOURCE_CONFIG to $TARGET_CONFIG..."
cp "$SOURCE_CONFIG" "$TARGET_CONFIG"

echo "Restarting Karabiner console user server..."
# killall returns non-zero if process not found, which is fine, so we allow it
killall karabiner_console_user_server || echo "Karabiner server was not running (or failed to kill), it should start automatically if enabled."

echo "Done! Configuration applied."
