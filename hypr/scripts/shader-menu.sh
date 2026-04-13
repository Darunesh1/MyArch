#!/usr/bin/env bash

SHADER_DIR="$HOME/.config/hypr/shaders"

if [[ ! -d "$SHADER_DIR" ]]; then
    notify-send "Shader Menu" "Shader directory not found: $SHADER_DIR"
    exit 1
fi

OPTIONS="None\n$(ls -1 "$SHADER_DIR" | grep '\.frag$')"

# Added -theme-str to change the placeholder text just for this menu
CHOICE=$(echo -e "$OPTIONS" | rofi -dmenu -i -p "󰏗  Shader" -theme ~/.config/rofi/themes/clipboard.rasi -theme-str 'entry { placeholder: "Search shaders..."; }')

if [[ "$CHOICE" == "None" ]]; then
    hyprctl keyword decoration:screen_shader "[[EMPTY]]"
    notify-send "Hyprland Shaders" "Shader cleared."
elif [[ -n "$CHOICE" ]]; then
    hyprctl keyword decoration:screen_shader "$SHADER_DIR/$CHOICE"
    notify-send "Hyprland Shaders" "Applied: $CHOICE"
fi
