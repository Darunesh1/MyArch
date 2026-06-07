#!/bin/bash

# Fetch a 1-second sample of GPU data in pure JSON format
# We use timeout to stop it after 1.2 seconds since the tool runs forever
json_out=$(timeout 1.2 intel_gpu_top -J -s 1000 2>/dev/null)

# Find the "Render/3D" section and extract the "busy" percentage
usage=$(echo "$json_out" | awk '/"Render\/3D"/ {found=1} found && /"busy"/ {print $2; exit}' | tr -d '%,')

# Output the format Waybar expects
if [[ -n "$usage" ]]; then
    printf '{"text": "%.0f"}\n' "$usage"
else
    # Fallback if no usage is detected
    printf '{"text": "0"}\n'
fi
