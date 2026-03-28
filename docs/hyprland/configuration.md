---
title: Configuration Guide
parent: Hyprland
nav_order: 2
---

# Configuration Guide

This page provides a detailed breakdown of the `hyprland.conf` configuration file.

## Monitors Section

Configure your display settings:

```ini
monitor=eDP-1,1920x1080@60,0x0,1
```

**Format:** `monitor=<name>,<resolution>@<refresh>,<position>,<scale>`

| Parameter | Description |
|-----------|-------------|
| `eDP-1` | Monitor name (find with `hyprctl monitors`) |
| `1920x1080@60` | Resolution and refresh rate |
| `0x0` | Position (X, Y coordinates) |
| `1` | Scale factor (1.0 = 100%) |

## Programs Section

Define application variables for use throughout the config:

```ini
$terminal = kitty
$fileManager = thunar
$menu = rofi -show drun
```

## Autostart Section

Applications that launch automatically when Hyprland starts:

```ini
exec-once = waybar & disown
exec-once = wl-paste --type text --watch cliphist store
exec-once = wl-paste --type image --watch cliphist store
exec-once = awww-daemon
exec-once = ~/.config/hypr/scripts/awww-cycle.sh
```

| Application | Purpose |
|-------------|---------|
| `waybar` | Status bar |
| `cliphist store` | Clipboard history (text & images) |
| `awww-daemon` | Wallpaper management |
| `awww-cycle.sh` | Automatic wallpaper cycling |

## Environment Variables

Set environment variables for application compatibility:

```ini
env = XCURSOR_SIZE,24
env = HYPRCURSOR_SIZE,24
```

## Look and Feel

### General Settings

```ini
general {
    gaps_in = 2              # Inner gaps between windows
    gaps_out = 4             # Outer gaps at screen edges
    border_size = 2          # Window border thickness
    col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
    col.inactive_border = rgba(595959aa)
    resize_on_border = false
    allow_tearing = false
    layout = dwindle
}
```

### Decoration

```ini
decoration {
    rounding = 10
    rounding_power = 2
    active_opacity = 1.0
    inactive_opacity = 1.0
    
    shadow {
        enabled = true
        range = 4
        render_power = 3
        color = rgba(1a1a1aee)
    }
    
    blur {
        enabled = true
        size = 3
        passes = 1
        vibrancy = 0.1696
    }
}
```

### Animations

The configuration includes extensive animations with custom bezier curves:

```ini
animations {
    enabled = yes, please :)
    
    bezier = easeOutQuint,   0.23, 1,    0.32, 1
    bezier = easeInOutCubic, 0.65, 0.05, 0.36, 1
    bezier = linear,         0,    0,    1,    1
    bezier = almostLinear,   0.5,  0.5,  0.75, 1
    bezier = quick,          0.15, 0,    0.1,  1
    
    animation = border,        1,     5.39,  easeOutQuint
    animation = windows,       1,     4.79,  easeOutQuint
    animation = workspaces,    1,     1.94,  almostLinear, fade
    # ... more animations
}
```

### Dwindle Layout

```ini
dwindle {
    pseudotile = true        # Windows keep their preferred size
    preserve_split = true    # Maintains split direction on close
}
```

### Misc Settings

```ini
misc {
    force_default_wallpaper = 0
    disable_hyprland_logo = true
}
```

## Input Section

Configure keyboard, mouse, and touchpad:

```ini
input {
    kb_layout = us           # Keyboard layout
    kb_variant =
    kb_model =
    kb_options =
    kb_rules =
    follow_mouse = 1
    sensitivity = 0
    
    touchpad {
        natural_scroll = true
    }
}

# Per-device configuration
device {
    name = epic-mouse-v1
    sensitivity = -0.5
}
```

## Gesture Configuration

```ini
gesture = 3, horizontal, workspace
```

Three-finger horizontal swipe to switch workspaces.

## Window Rules

Special rules for specific applications:

```ini
windowrule {
    name = suppress-maximize-events
    match:class = .*
    suppress_event = maximize
}

windowrule {
    name = fix-xwayland-drags
    match:class = ^$
    match:xwayland = true
    match:float = true
    no_focus = true
}
```

## Customization Tips

### Change Gaps

```ini
general {
    gaps_in = 5    # Larger inner gaps
    gaps_out = 10  # Larger outer gaps
}
```

### Disable Animations

```ini
animations {
    enabled = false
}
```

### Change Border Colors

```ini
general {
    col.active_border = rgba(ff0000ee)    # Red active border
    col.inactive_border = rgba(595959aa)  # Gray inactive border
}
```

### Adjust Blur Intensity

```ini
decoration {
    blur {
        size = 5      # Larger blur radius
        passes = 2    # More blur passes (higher quality)
    }
}
```
