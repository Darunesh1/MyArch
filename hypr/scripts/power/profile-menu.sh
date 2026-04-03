#!/bin/bash

# Define the display options
power="󰌪 Power Saving"
balanced="⚖️ Balanced"
performance="󰾆 Ultra Performance"

# Open Rofi menu using your existing launcher theme
selected=$(echo -e "$power\n$balanced\n$performance" | rofi -dmenu -i -p "Power Profile:" -theme ~/.config/rofi/themes/launcher.rasi)

# Apply the chosen profile
case $selected in
    "$power")
        ~/.config/hypr/scripts/power/hypr-profile.sh power
        ;;
    "$balanced")
        ~/.config/hypr/scripts/power/hypr-profile.sh balanced
        ;;
    "$performance")
        ~/.config/hypr/scripts/power/hypr-profile.sh performance
        ;;
esac
