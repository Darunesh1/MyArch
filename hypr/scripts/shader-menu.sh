#!/usr/bin/env bash

SHADER_DIR="$HOME/.config/hypr/shaders"
STATE_FILE="$HOME/.config/hypr/config/active-shader.conf"

if [[ ! -d "$SHADER_DIR" ]]; then
    notify-send "Shader Menu" "Shader directory not found: $SHADER_DIR"
    exit 1
fi

OPTIONS="None\n$(ls -1 "$SHADER_DIR" | grep '\.frag$')"

CHOICE=$(echo -e "$OPTIONS" | rofi -dmenu -i -p "󰏗  Shader" -theme ~/.config/rofi/themes/shader.rasi)

if [[ "$CHOICE" == "None" ]]; then
    # Apply instantly
    hyprctl keyword decoration:screen_shader "[[EMPTY]]"
    
    # Completely empty the state file
    > "$STATE_FILE"
    
    notify-send "Hyprland Shaders" "Shader cleared."
    
elif [[ -n "$CHOICE" ]]; then
    # Apply instantly
    hyprctl keyword decoration:screen_shader "$SHADER_DIR/$CHOICE"
    
    # Write the exact block syntax Hyprland expects into the state file
    echo "decoration {
    screen_shader = $SHADER_DIR/$CHOICE
}" > "$STATE_FILE"
    
    notify-send "Hyprland Shaders" "Applied: $CHOICE"
fi
