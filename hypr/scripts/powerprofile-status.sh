#!/bin/bash

profile=$(powerprofilesctl get)

if [ "$profile" = "power-saver" ]; then
    icon="󰌪"
    text="Ultra Power Saving"
elif [ "$profile" = "balanced" ]; then
    icon="󰾆"
    text="Balanced"
elif [ "$profile" = "performance" ]; then
    icon="󰓅"
    text="Ultra Performance"
else
    icon="󰾆"
    text="Unknown"
fi

# Output JSON for Waybar
echo "{\"text\": \"$icon\", \"tooltip\": \"$text\"}"
