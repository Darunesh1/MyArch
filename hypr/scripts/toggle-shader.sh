#!/usr/bin/env bash

# Adjust this path if your config folder is named differently
SHADER="$HOME/.config/hypr/shaders/extradim.frag"

# Check if a shader is currently active
if hyprctl getoption decoration:screen_shader | grep -q "\[\[EMPTY\]\]"; then
    hyprctl keyword decoration:screen_shader "$SHADER"
    notify-send -t 2000 "Display" "Dim/Warm Shader Enabled"
else
    hyprctl keyword decoration:screen_shader "[[EMPTY]]"
    notify-send -t 2000 "Display" "Shader Disabled"
fi
