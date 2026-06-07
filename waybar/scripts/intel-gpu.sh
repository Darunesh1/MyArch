#!/bin/bash

# Continuously read from intel_gpu_top and output JSON for Waybar
intel_gpu_top -l -s 2000 | while read -r line; do
    # Look for the line containing the 3D rendering engine
    if [[ "$line" == *"Render/3D"* ]]; then
        # Extract the usage percentage (usually the 2nd column) and remove the % sign
        usage=$(echo "$line" | awk '{print $2}' | sed 's/%//')
        
        # Round the number and format it as JSON for Waybar
        if [[ -n "$usage" ]]; then
            printf '{"text": "%.0f"}\n' "$usage"
        fi
    fi
done
