#!/bin/bash
# Highly optimized continuous stream for Waybar

intel_gpu_top -J -s 1000 2>/dev/null | awk '
/"Render\/3D"/ { in_render=1 }
in_render && /"busy"/ {
    # Extract the raw number (e.g., 12.34, -> 12) and format it
    gsub(/[^0-9.]/, "", $2)
    printf "{\"text\": \"%.0f\"}\n", $2
    fflush() # Instantly push to Waybar
    in_render=0
}'
