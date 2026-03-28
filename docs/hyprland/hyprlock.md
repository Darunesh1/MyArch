---
title: Hyprlock Setup
parent: Hyprland
nav_order: 3
---

# Hyprlock Configuration

Hyprlock is the official screen locker for Hyprland. This page documents the lock screen configuration.

## Overview

The MyArch hyprlock configuration provides:

- **Blurred Wallpaper Background**: Uses your current wallpaper with blur effect
- **Centered Password Input**: Clean, minimal password entry field
- **Custom Styling**: Gray color scheme with rounded corners

## File Location

```
~/.config/hypr/hyprlock.conf
```

## Configuration Breakdown

### General Settings

```ini
general {
    no_fade_in = false      # Enable fade-in animation on unlock
    grace = 0               # No grace period before locking
    disable_loading = false # Show loading indicator
}
```

| Setting | Description |
|---------|-------------|
| `no_fade_in` | When `false`, shows a smooth fade-in when unlocking |
| `grace` | Seconds to allow unlocking after sleep (0 = immediate) |
| `disable_loading` | When `false`, shows a spinner during authentication |

### Background

```ini
background {
    monitor =                   # Apply to all monitors
    path = /home/darriour/Pictures/Wallpaper/current_wallpaper
    blur_passes = 0             # No blur on background
}
```

| Setting | Description |
|---------|-------------|
| `monitor` | Leave empty to apply to all monitors, or specify (e.g., `eDP-1`) |
| `path` | Path to wallpaper image (symlink managed by awww-cycle.sh) |
| `blur_passes` | Number of blur passes (0 = no blur, higher = more blur) |

### Input Field

```ini
input-field {
    monitor =                 # Apply to all monitors
    size = 200, 50            # Width, height in pixels
    outline_thickness = 3     # Border thickness
    dots_size = 0.33          # Size of password dots
    dots_spacing = 0.15       # Spacing between dots
    dots_center = true        # Center the dots
    outer_color = rgb(151515) # Gray border color
    inner_color = rgb(200, 200, 200) # Light gray background
    font_color = rgb(10, 10, 10)     # Dark text color
    fade_on_empty = true      # Fade when empty
    placeholder_text = <i>Input Password...</i>
    hide_input = false        # Show dots (true = hide completely)
    position = 0, -20         # X, Y offset from alignment
    halign = center           # Horizontal alignment
    valign = center           # Vertical alignment
}
```

## Customization

### Change Wallpaper Path

Update the `path` in the `background` section:

```ini
background {
    path = /path/to/your/wallpaper.jpg
}
```

Or use a fixed path instead of the symlink:

```ini
background {
    path = /home/darriour/Pictures/Wallpaper/my_favorite.png
}
```

### Add Background Blur

```ini
background {
    blur_passes = 3    # 3 passes of blur
}
```

### Change Input Field Colors

```ini
input-field {
    outer_color = rgb(53, 132, 228)   # Blue border (One Dark blue)
    inner_color = rgb(42, 46, 56)     # Dark background
    font_color = rgb(209, 213, 219)   # Light text
}
```

### Resize Input Field

```ini
input-field {
    size = 300, 60    # Wider and taller
}
```

### Change Placeholder Text

```ini
input-field {
    placeholder_text = <i>Type your password...</i>
}
```

### Position Input Field

```ini
input-field {
    position = 0, -100    # Move 100px up from center
    halign = center
    valign = center
}
```

Other alignment options:
- `halign`: `left`, `center`, `right`
- `valign`: `top`, `center`, `bottom`

### Multiple Monitors

Configure separate input fields for each monitor:

```ini
input-field {
    monitor = eDP-1
    size = 200, 50
    position = 0, -20
    halign = center
    valign = center
}

input-field {
    monitor = HDMI-A-1
    size = 200, 50
    position = 0, -20
    halign = center
    valign = center
}
```

## Manual Locking

Lock your screen manually with:

```bash
hyprlock
```

Or use the keybinding:

| Keybinding | Action |
|------------|--------|
| `Super + L` | Lock screen |

## Automatic Locking

To lock automatically after inactivity, add to `hyprland.conf`:

```ini
# Lock after 5 minutes of inactivity
exec-once = swayidle -w timeout 300 'hyprlock'
```

## Testing

Test your hyprlock configuration without actually locking:

```bash
# Run in test mode (shows the lock screen, Ctrl+C to exit)
hyprlock
```

Check for configuration errors:

```bash
hyprlock --check
```
