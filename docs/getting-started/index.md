---
title: Getting Started
layout: default
nav_order: 2
has_children: true
---

# Getting Started

This guide will help you install and configure MyArch on your Arch Linux system.

## Prerequisites

Before installing MyArch, ensure you have:

1. **Arch Linux** installed and updated
2. **Git** for cloning the repository
3. A **Wayland-compatible GPU** with proper drivers

## Installation Steps

### 1. Install Required Packages

Install the core packages:

```bash
# Core components
sudo pacman -S hyprland waybar kitty rofi hyprlock

# Utilities
sudo pacman -S grim slurp wl-clipboard cliphist playerctl brightnessctl

# Optional but recommended
sudo pacman -S thunar firefox pavucontrol
```

Install `awww-daemon` from AUR:

```bash
# Using yay
yay -S awww-daemon

# Or using paru
paru -S awww-daemon
```

### 2. Clone the Repository

```bash
git clone https://github.com/darriour/MyArch.git
cd MyArch
```

### 3. Create Configuration Symlinks

Link the configuration directories to `~/.config/`:

```bash
# Create symlinks
ln -s $(pwd)/hypr ~/.config/hypr
ln -s $(pwd)/waybar ~/.config/waybar
ln -s $(pwd)/kitty ~/.config/kitty
```

### 4. Configure Your System

#### Monitor Setup

Edit `~/.config/hypr/hyprland.conf` to match your monitor:

```ini
# Find your monitor name with: hyprctl monitors
monitor=eDP-1,1920x1080@60,0x0,1
```

#### Keyboard Layout

Update the keyboard layout in `hyprland.conf`:

```ini
input {
    kb_layout = us  # Change to your layout (de, fr, es, etc.)
}
```

### 5. Start Hyprland

Add Hyprland to your boot loader or start it from your display manager:

**For .xinitrc:**
```bash
exec Hyprland
```

**For GDM/SDDM:** Select "Hyprland" session at login.

### 6. Verify Installation

After starting Hyprland, test these keybindings:

| Keybinding | Expected Result |
|------------|-----------------|
| `Super + T` | Opens kitty terminal |
| `Super + A` | Opens rofi application menu |
| `Super + L` | Locks screen with hyprlock |

## Next Steps

- [Configure Hyprland]({{ site.baseurl }}/hyprland/configuration/) - Learn about configuration options
- [Keybindings Reference]({{ site.baseurl }}/hyprland/keybindings/) - Master all keyboard shortcuts
- [Customize Waybar](#) - Modify the status bar appearance
