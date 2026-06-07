# Waybar

Waybar provides a highly customizable status bar at the top of your screen.

## Optimized Modules

MyArch includes several custom modules designed for performance and aesthetics.

### GPU Usage (Intel Iris Xe)

Most GPU scripts poll the system at fixed intervals, which can lead to "frozen" or inaccurate values if the polling is too slow.

MyArch uses a **Continuous Streaming (Push-Based)** script for GPU tracking.
- **The Script**: `~/.config/waybar/scripts/intel-gpu.sh`
- **How it works**: Instead of running once and exiting, the script opens a continuous JSON stream from `intel_gpu_top`. An optimized `awk` pipeline parses this stream in real-time and pushes only the global engine usage to Waybar.
- **Performance**: This method provides second-by-second accuracy with **effectively 0% CPU overhead**.

### CPU & Memory

- **CPU**: Monitored every 3 seconds using the native Waybar module for maximum efficiency.
- **Memory**: Displays used RAM in GiB, updated every 5 seconds.

### Power Profiles

The power profile module allows you to switch between "Performance", "Balanced", and "Power Saver" modes directly from the bar. It integrates with `power-profiles-daemon`.

## Customization

You can customize the layout and modules of Waybar by editing `~/.config/waybar/config.jsonc`.

Styles (colors, spacing, rounding) are defined in:
- `~/.config/waybar/style.css`
- `~/.config/waybar/style/one-dark.css`
