---
title: Keybindings Reference
parent: Hyprland
nav_order: 1
---

# Keybindings Reference

This page lists all keyboard shortcuts configured in MyArch. The main modifier key is **Super** (Windows key).

## Quick Reference Card

| Category | Keybindings |
|----------|-------------|
| Apps | `Super+T`, `Super+E`, `Super+B`, `Super+A` |
| Windows | `Super+Q`, `Super+W`, `Super+F`, `Alt+F4` |
| Workspaces | `Super+[0-9]`, `Super+Shift+[0-9]` |
| Focus | `Super+[Arrows]`, `Super+[HJKL]` |
| System | `Super+L`, `Super+R`, Volume/Brightness keys |
| Screenshots | `Print`, `Super+P` |

---

## Application Launchers

| Keybinding | Action |
|------------|--------|
| `Super + T` | Open terminal (kitty) |
| `Super + E` | Open file manager (thunar) |
| `Super + B` | Open Firefox browser |
| `Super + A` | Open application menu (rofi) |

---

## Window Management

| Keybinding | Action |
|------------|--------|
| `Super + Q` | Kill/close active window |
| `Alt + F4` | Kill/close active window (alternative) |
| `Super + W` | Toggle floating window |
| `Super + Shift + W` | Toggle pseudotiling (dwindle) |
| `Super + F` | Toggle fullscreen |
| `Super + Shift + F` | Toggle true fullscreen (covers panels) |
| `Super + J` | Toggle split direction (dwindle) |

---

## Workspace Navigation

### Switch to Workspace

| Keybinding | Action |
|------------|--------|
| `Super + 1` | Switch to workspace 1 |
| `Super + 2` | Switch to workspace 2 |
| `Super + 3` | Switch to workspace 3 |
| `Super + 4` | Switch to workspace 4 |
| `Super + 5` | Switch to workspace 5 |
| `Super + 6` | Switch to workspace 6 |
| `Super + 7` | Switch to workspace 7 |
| `Super + 8` | Switch to workspace 8 |
| `Super + 9` | Switch to workspace 9 |
| `Super + 0` | Switch to workspace 10 |

### Move Window to Workspace

| Keybinding | Action |
|------------|--------|
| `Super + Shift + 1` | Move window to workspace 1 |
| `Super + Shift + 2` | Move window to workspace 2 |
| `Super + Shift + 3` | Move window to workspace 3 |
| `Super + Shift + 4` | Move window to workspace 4 |
| `Super + Shift + 5` | Move window to workspace 5 |
| `Super + Shift + 6` | Move window to workspace 6 |
| `Super + Shift + 7` | Move window to workspace 7 |
| `Super + Shift + 8` | Move window to workspace 8 |
| `Super + Shift + 9` | Move window to workspace 9 |
| `Super + Shift + 0` | Move window to workspace 10 |

### Special Workspace (Scratchpad)

| Keybinding | Action |
|------------|--------|
| `Super + S` | Toggle special workspace (scratchpad) |
| `Super + Shift + S` | Move window to special workspace |

### Scroll Through Workspaces

| Keybinding | Action |
|------------|--------|
| `Super + Mouse Down` | Switch to next workspace |
| `Super + Mouse Up` | Switch to previous workspace |

---

## Focus Movement

| Keybinding | Action |
|------------|--------|
| `Super + Left` | Move focus to window on the left |
| `Super + Right` | Move focus to window on the right |
| `Super + Up` | Move focus to window above |
| `Super + Down` | Move focus to window below |

---

## Window Movement & Resizing

| Keybinding | Action |
|------------|--------|
| `Super + Left Mouse Button (hold + drag)` | Move window |
| `Super + Right Mouse Button (hold + drag)` | Resize window |

---

## Screenshots

| Keybinding | Action |
|------------|--------|
| `Print` | Fullscreen screenshot (saved to ~/Pictures/Screenshots) |
| `Super + P` | Screenshot selected area (saved to ~/Pictures/Screenshots) |

Both keybindings also copy the screenshot to clipboard.

---

## System Controls

### Lock & Power

| Keybinding | Action |
|------------|--------|
| `Super + L` | Lock screen (hyprlock) |
| `Ctrl + Alt + Delete` | Open power menu (wlogout) |
| `Super + R` | Reload waybar |

### Volume Control

| Keybinding | Action |
|------------|--------|
| `XF86AudioRaiseVolume` | Increase volume (+5%) |
| `XF86AudioLowerVolume` | Decrease volume (-5%) |
| `XF86AudioMute` | Toggle mute |
| `XF86AudioMicMute` | Toggle microphone mute |

### Media Playback (requires playerctl)

| Keybinding | Action |
|------------|--------|
| `XF86AudioNext` | Next track |
| `XF86AudioPlay` | Play/Pause |
| `XF86AudioPause` | Play/Pause |
| `XF86AudioPrev` | Previous track |

### Brightness Control (Laptop)

| Keybinding | Action |
|------------|--------|
| `XF86MonBrightnessUp` | Increase brightness (+5%) |
| `XF86MonBrightnessDown` | Decrease brightness (-5%) |

---

## Clipboard

| Keybinding | Action |
|------------|--------|
| `Super + V` | Open clipboard history (rofi menu) |

Select an entry to paste it. Supports both text and images.

---

## Tips

### Finding Keybindings in Config

Keybindings are defined in `~/.config/hypr/hyprland.conf` with the following syntax:

```ini
# Basic bind: bind = $mainMod, KEY, action
bind = $mainMod, T, exec, $terminal

# Bind without modifier: bind = , KEY, action
bind = , Print, exec, grim

# Bind with multiple modifiers: bind = $mainMod SHIFT, KEY, action
bind = $mainMod SHIFT, 1, movetoworkspace, 1
```

### Custom Keybindings

Add new keybindings to `hyprland.conf`:

```ini
# Launch calculator
bind = $mainMod, C, exec, gnome-calculator

# Lock orientation
bind = $mainMod, O, exec, wlr-randr --output eDP-1 --transform normal
```
