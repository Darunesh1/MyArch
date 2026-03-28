---
title: Hyprland
layout: default
nav_order: 3
has_children: true
---

# Hyprland Configuration

Hyprland is a dynamic tiling Wayland compositor that provides a modern, feature-rich desktop experience. This section documents the MyArch Hyprland configuration.

## Overview

The MyArch Hyprland configuration provides:

- **Dwindle Layout**: Automatic tiling with spiral pattern
- **Smooth Animations**: Bezier-curved animations for windows and workspaces
- **Comprehensive Keybindings**: Super-key based shortcuts for efficient workflow
- **Autostart Applications**: Status bar, clipboard manager, wallpaper daemon
- **Screen Locking**: Secure lock screen with hyprlock

## File Structure

```
hypr/
├── hyprland.conf      # Main configuration file
├── hyprlock.conf      # Screen lock configuration
└── scripts/
    └── awww-cycle.sh  # Wallpaper cycling script
```

## Configuration Sections

The `hyprland.conf` file is organized into the following sections:

| Section | Description |
|---------|-------------|
| **Monitors** | Display configuration and resolution |
| **Programs** | Application variables (terminal, file manager, menu) |
| **Autostart** | Applications launched on startup |
| **Environment** | Environment variables for X11/Wayland compatibility |
| **Look and Feel** | Gaps, borders, shadows, blur, and animations |
| **Input** | Keyboard layout, mouse, and touchpad settings |
| **Keybindings** | All keyboard shortcuts |
| **Window Rules** | Special rules for specific applications |

## Quick Reference

### Main Modifier Key

All keybindings use the **Super** (Windows) key as the main modifier:

```ini
$mainMod = SUPER
```

### Default Programs

```ini
$terminal = kitty
$fileManager = thunar
$menu = rofi -show drun
```

### Layout

The configuration uses the **dwindle** layout with pseudotiling enabled:

```ini
general {
    layout = dwindle
}

dwindle {
    pseudotile = true
    preserve_split = true
}
```

## Related Documentation

- [Configuration Guide]({{ site.baseurl }}/hyprland/configuration/) - Detailed breakdown of all settings
- [Keybindings Reference]({{ site.baseurl }}/hyprland/keybindings/) - Complete keyboard shortcut list
- [Hyprlock Setup]({{ site.baseurl }}/hyprland/hyprlock/) - Screen lock configuration
- [Wallpaper Script]({{ site.baseurl }}/hyprland/scripts/awww-cycle/) - Automatic wallpaper cycling
