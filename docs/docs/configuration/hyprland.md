# Hyprland

Hyprland is the heart of MyArch. It provides a smooth, dynamic tiling window management experience.

## Keybindings

MyArch uses the `Super` (Windows) key as the primary modifier (`$mainMod`).

| Keybinding | Action |
|------------|--------|
| `Super + T` | Open Kitty Terminal |
| `Super + Q` | Kill Active Window |
| `Super + M` | Exit Hyprland |
| `Super + E` | Open File Manager (Thunar) |
| `Super + V` | Toggle Floating |
| `Super + A` | Open Rofi Launcher |
| `Super + S` | Toggle Special Workspace (Scratchpad) |
| `Super + L` | Lock Screen (Hyprlock) |

## Focus & Decoration

MyArch is configured for maximum focus and minimal distraction.

### Special Workspace (Scratchpad)

When you toggle the special workspace (`Super + S`), MyArch applies a **Dim Effect** instead of a full-screen blur. This ensures that:
1. Your primary windows are darkened to reduce distraction.
2. **Waybar remains crisp and readable** at the top of the screen.

You can adjust this in `~/.config/hypr/config/appearance.conf`:

```hyprlang
decoration {
    # ...
    dim_special = 0.5  # Adjust between 0.0 and 1.0
}
```

### Window Rules

MyArch includes several rules to improve the user experience:
- **Rofi**: Automatically centered on the cursor.
- **XWayland**: Fixes for dragging issues.
- **Floating Windows**: Specific apps like `pavucontrol` are set to float by default.

Rules are defined in `~/.config/hypr/config/rules.conf`.
