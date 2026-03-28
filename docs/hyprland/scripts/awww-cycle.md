---
title: Wallpaper Script
parent: Hyprland
grand_parent: Scripts
nav_order: 1
---

# AWWW Wallpaper Cycling Script

The `awww-cycle.sh` script automatically cycles through wallpapers at a set interval with smooth transitions.

## Overview

| Property | Value |
|----------|-------|
| **Location** | `~/.config/hypr/scripts/awww-cycle.sh` |
| **Daemon** | `awww-daemon` |
| **Interval** | 200 seconds (configurable) |
| **Transition** | Random transition effect |

## Script Details

```bash
#!/bin/bash

# Define the directory and the interval (in seconds)
WALLPAPER_DIR="/home/darriour/Pictures/Wallpaper"
INTERVAL=200

while true; do
    # Find all images in the folder and pick a random one
    IMG=$(find "$WALLPAPER_DIR" -type f \( -iname \*.jpg -o -iname \*.png -o -iname \*.jpeg \) | shuf -n 1)

    # Apply the wallpaper with a smooth transition
    awww img "$IMG" --transition-fps 60 --transition-type random --transition-duration 2

    # Create a symlink to the current wallpaper
    ln -sf "$IMG" /home/darriour/Pictures/Wallpaper/current_wallpaper
    
    # Wait for the specified interval before changing again
    sleep $INTERVAL
done
```

## How It Works

1. **Image Selection**: Uses `find` to locate all `.jpg`, `.jpeg`, and `.png` files in the wallpaper directory
2. **Random Pick**: `shuf -n 1` randomly selects one image from the results
3. **Apply Wallpaper**: Uses `awww` to set the wallpaper with a smooth transition
4. **Create Symlink**: Creates/updates `current_wallpaper` symlink for hyprlock to use
5. **Wait**: Sleeps for the configured interval before repeating

## Configuration Options

### Change Wallpaper Directory

Edit the `WALLPAPER_DIR` variable:

```bash
WALLPAPER_DIR="/home/your-user/Pictures/Wallpapers"
```

### Change Interval

Edit the `INTERVAL` variable (in seconds):

```bash
INTERVAL=300    # Change every 5 minutes
INTERVAL=600    # Change every 10 minutes
INTERVAL=3600   # Change every hour
```

### Change Transition Effect

Available transition types:

| Transition | Description |
|------------|-------------|
| `simple` | Instant change, no animation |
| `fade` | Crossfade between wallpapers |
| `left` | Slide from left |
| `right` | Slide from right |
| `top` | Slide from top |
| `bottom` | Slide from bottom |
| `wipe` | Wipe effect |
| `wave` | Wave animation |
| `grow` | Grow from center |
| `center` | Expand from center |
| `random` | Random transition each time |

Change the transition type:

```bash
awww img "$IMG" --transition-fps 60 --transition-type fade --transition-duration 2
```

### Adjust Transition Speed

```bash
# Faster transition (1 second)
awww img "$IMG" --transition-fps 60 --transition-type fade --transition-duration 1

# Slower transition (3 seconds)
awww img "$IMG" --transition-fps 60 --transition-type fade --transition-duration 3
```

### Adjust Transition Quality

```bash
# Higher FPS (smoother but more CPU usage)
--transition-fps 120

# Lower FPS (less CPU usage)
--transition-fps 30
```

## Manual Control

### Set a Specific Wallpaper

```bash
awww img /path/to/wallpaper.jpg
```

### Set Wallpaper with Transition

```bash
awww img /path/to/wallpaper.jpg --transition-type fade --transition-duration 2
```

### View Current Wallpaper

```bash
readlink /home/darriour/Pictures/Wallpaper/current_wallpaper
```

## Autostart

The script is configured to start automatically with Hyprland. In `hyprland.conf`:

```ini
exec-once = ~/.config/hypr/scripts/awww-cycle.sh
```

### Manual Start

Start the script manually:

```bash
~/.config/hypr/scripts/awww-cycle.sh &
```

### Stop the Script

Find and kill the process:

```bash
# Find the PID
pgrep -f awww-cycle.sh

# Kill it
kill <PID>

# Or kill all instances
pkill -f awww-cycle.sh
```

## Supported Image Formats

| Format | Extensions |
|--------|------------|
| JPEG | `.jpg`, `.jpeg` |
| PNG | `.png` |

Add more formats by editing the find command:

```bash
IMG=$(find "$WALLPAPER_DIR" -type f \( -iname \*.jpg -o -iname \*.png -o -iname \*.jpeg -o -iname \*.gif -o -iname \*.bmp \) | shuf -n 1)
```

## Tips

### Organize Wallpapers by Resolution

Create separate directories for different resolutions:

```
~/Pictures/Wallpapers/
├── 1920x1080/
├── 2560x1440/
└── 3840x2160/
```

Update the script to use the appropriate directory.

### Exclude the Symlink

The symlink `current_wallpaper` is in the same directory. To exclude it from random selection:

```bash
IMG=$(find "$WALLPAPER_DIR" -type f ! -name "current_wallpaper" \( -iname \*.jpg -o -iname \*.png -o -iname \*.jpeg \) | shuf -n 1)
```

### Log Wallpaper Changes

Add logging to track which wallpapers are applied:

```bash
echo "$(date): Applied $IMG" >> ~/.cache/awww-cycle.log
```
