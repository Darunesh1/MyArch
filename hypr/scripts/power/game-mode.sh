#!/bin/bash

STATE_FILE="/tmp/game_mode_state"

# If already enabled → disable it
if [ -f "$STATE_FILE" ]; then
    echo "Disabling Game Mode..."

    powerprofilesctl set balanced
    hyprctl keyword animations:enabled 1

    rm "$STATE_FILE"

    notify-send "Game Mode" "Disabled ❌"
    exit 0
fi

# Enable Game Mode
echo "Enabling Game Mode..."

# Save state
touch "$STATE_FILE"

# Switch to performance
powerprofilesctl set performance

# Reduce compositor overhead
hyprctl keyword animations:enabled 0
hyprctl keyword decoration:shadow:enabled 0
hyprctl keyword decoration:blur:enabled 0
hyprctl keyword misc:vfr 0

# Export Mesa optimizations for future apps
export MESA_GLTHREAD=true
export MESA_NO_ERROR=1

notify-send "Game Mode" "Enabled 🎮"

# Optional: launch something automatically (commented)
# mangohud gamemoderun ryujinx
