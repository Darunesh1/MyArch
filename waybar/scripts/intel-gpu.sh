#!/bin/bash
# Highly optimized continuous stream for Waybar

intel_gpu_top -J -s 1000 2>/dev/null | awk '
/^	"engines": \{/ { in_engines=1 }    # Enter global engines block
/^	\},/ { in_engines=0 }              # Exit global engines block

in_engines && /"Render\/3D"/ { in_render=1 }
in_render && /"busy"/ {
    gsub(/[^0-9.]/, "", $2)
    printf "{\"text\": \"%.0f\"}\n", $2
    fflush()
    in_render=0
}'
