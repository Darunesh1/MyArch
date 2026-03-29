# Hyprland Configuration

Modular Hyprland configuration for easy navigation and maintenance.

## Structure

```
~/.config/hypr/
├── hyprland.conf          # Main entry point (sources all config files)
├── hyprlock.conf          # Lock screen configuration
├── README.md              # This file
│
├── config/                # Modular configuration files
│   ├── variables.conf     # Environment variables, programs, paths
│   ├── monitors.conf      # Monitor configurations
│   ├── appearance.conf    # Colors, borders, gaps, opacity, blur
│   ├── animations.conf    # Animation curves and settings
│   ├── input.conf         # Keyboard, mouse, touchpad settings
│   ├── binds.conf         # Keybindings (grouped by function)
│   ├── layouts.conf       # Dwindle & Master layout settings
│   ├── autostart.conf     # Startup applications
│   └── rules.conf         # Window and workspace rules
│
└── scripts/               # Custom scripts
    ├── power/             # Power management
    │   ├── hypr-profile.sh       # Apply Hyprland profiles
    │   ├── powerprofile-status.sh # Status for waybar
    │   └── profile-menu.sh        # Rofi menu for profiles
    │
    └── wallpaper/         # Wallpaper management
        └── awww-cycle.sh  # Auto-cycle wallpapers
```

## Quick Reference

### Edit Configuration
| File | Purpose |
|------|---------|
| `variables.conf` | Set programs (`$terminal`, `$menu`), environment vars |
| `monitors.conf` | Monitor resolution and positioning |
| `appearance.conf` | Colors, gaps, borders, shadows, blur |
| `animations.conf` | Animation speeds and curves |
| `input.conf` | Keyboard layout, mouse sensitivity, touchpad |
| `binds.conf` | All keybindings |
| `layouts.conf` | Dwindle/Master layout options |
| `autostart.conf` | Programs that start with Hyprland |
| `rules.conf` | Window rules (float, move, etc.) |

### Keybindings

| Key | Action |
|-----|--------|
| `SUPER + T` | Open terminal |
| `SUPER + Q` | Kill active window |
| `SUPER + E` | Open file manager |
| `SUPER + B` | Open Firefox |
| `SUPER + A` | Open app launcher (rofi) |
| `SUPER + L` | Lock screen |
| `SUPER + V` | Clipboard manager |
| `SUPER + SHIFT + G` | Power profile menu |
| `SUPER + F` | Toggle fullscreen |
| `SUPER + W` | Toggle floating |
| `SUPER + [0-9]` | Switch workspace |
| `SUPER + SHIFT + [0-9]` | Move window to workspace |
| `Ctrl + Alt + Delete` | Power menu (wlogout) |
| `Print` | Screenshot full screen |
| `SUPER + P` | Screenshot selected area |

### Power Profiles

Access via `SUPER + SHIFT + G`:
- **Power Saving** - Disables animations, blur, shadows for max battery
- **Balanced** - Normal desktop experience
- **Performance** - Max performance for apps/games

## Usage

1. **Edit config files** in `~/.config/hypr/config/`
2. **Reload Hyprland** with `SUPER + SHIFT + R` (or logout/login)
3. **Check status** with `hyprctl config`

## Links

- [Hyprland Wiki](https://wiki.hypr.land/)
- [Configuring Variables](https://wiki.hypr.land/Configuring/Variables/)
- [Configuring Keywords](https://wiki.hypr.land/Configuring/Keywords/)
