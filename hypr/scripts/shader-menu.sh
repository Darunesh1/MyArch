#!/usr/bin/env bash

SHADER_DIR="$HOME/.config/hypr/shaders"

if [[ ! -d "$SHADER_DIR" ]]; then
    notify-send "Shader Menu" "Shader directory not found: $SHADER_DIR"
    exit 1
fi

OPTIONS="None\n$(ls -1 "$SHADER_DIR" | grep '\.frag$')"

# Pipe the options into Rofi using the new shader theme
CHOICE=$(echo -e "$OPTIONS" | rofi -dmenu -i -p "󰏗  Shader" -theme ~/.config/rofi/themes/shader.rasi)

if [[ "$CHOICE" == "None" ]]; then
    hyprctl keyword decoration:screen_shader "[[EMPTY]]"
    notify-send "Hyprland Shaders" "Shader cleared."
elif [[ -n "$CHOICE" ]]; then
    hyprctl keyword decoration:screen_shader "$SHADER_DIR/$CHOICE"
    notify-send "Hyprland Shaders" "Applied: $CHOICE"
fi
