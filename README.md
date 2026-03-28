# MyArch

[![Documentation](https://img.shields.io/badge/docs-view-blue?style=flat-square)](https://darriour.github.io/MyArch/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square)](https://opensource.org/licenses/MIT)

Hyprland dotfiles configuration for Arch Linux with Waybar, Kitty, and more.

## 📚 Documentation

For detailed setup instructions and configuration guides, visit the **[MyArch Documentation](https://darriour.github.io/MyArch/)**.

### Quick Links

- [Getting Started](https://darriour.github.io/MyArch/getting-started/) - Installation guide
- [Keybindings Reference](https://darriour.github.io/MyArch/hyprland/keybindings/) - All keyboard shortcuts
- [Configuration Guide](https://darriour.github.io/MyArch/hyprland/configuration/) - Detailed config breakdown

## Components

| Component | Description |
|-----------|-------------|
| **Hyprland** | Dynamic tiling Wayland compositor with animations and dwindle layout |
| **Waybar** | Customizable status bar with One Dark theme |
| **Kitty** | GPU-accelerated terminal with custom layouts |

## Features

- ✨ Smooth animations with bezier curves
- 🎨 One Dark color scheme
- 🖼️ Automatic wallpaper cycling with transitions
- 📋 Clipboard management with cliphist
- 📸 Screenshot tools (grim + slurp)
- 🔒 Secure screen locking with hyprlock

## Quick Install

```bash
# Clone the repository
git clone https://github.com/darriour/MyArch.git
cd MyArch

# Create symlinks
ln -s $(pwd)/hypr ~/.config/hypr
ln -s $(pwd)/waybar ~/.config/waybar
ln -s $(pwd)/kitty ~/.config/kitty
```

See the [full installation guide](https://darriour.github.io/MyArch/getting-started/) for dependencies and setup.

## License

MIT License - see [LICENSE](LICENSE) for details.
