#!/bin/bash
# updates.sh — counts pending pacman updates via checkupdates (pacman-contrib)
# Outputs waybar-compatible JSON with text, tooltip, and CSS class

COUNT=$(checkupdates 2>/dev/null | wc -l)

if [ "$COUNT" -eq 0 ]; then
    CLASS="updated"
    TEXT=" 0"
    TOOLTIP="System is up to date"
elif [ "$COUNT" -le 10 ]; then
    CLASS="low"
    TEXT=" $COUNT"
    TOOLTIP="$COUNT update(s) available"
elif [ "$COUNT" -le 30 ]; then
    CLASS="medium"
    TEXT=" $COUNT"
    TOOLTIP="$COUNT update(s) available"
else
    CLASS="high"
    TEXT=" $COUNT"
    TOOLTIP="$COUNT update(s) available — update soon!"
fi

printf '{"text":"%s","tooltip":"%s","class":"%s"}\n' "$TEXT" "$TOOLTIP" "$CLASS"
