#!/bin/bash
# wifi.sh — shows wifi signal strength % and internet connectivity
# Used as tooltip enhancer; main display handled by waybar network module

INTERFACE="wlan0"

# Check if interface is up
if ! ip link show "$INTERFACE" up &>/dev/null; then
    echo '{"text":"󰤭  no wifi","class":"disconnected","tooltip":"Interface down"}'
    exit 0
fi

# Get signal strength
SIGNAL=$(cat /proc/net/wireless 2>/dev/null | grep "$INTERFACE" | awk '{print $3}' | tr -d '.')
ESSID=$(iwgetid -r 2>/dev/null)

# Check internet connectivity (fast, low timeout)
if ping -c 1 -W 1 1.1.1.1 &>/dev/null; then
    INET="  internet ok"
    INET_CLASS="connected"
else
    INET="󰤫  no internet"
    INET_CLASS="no-internet"
fi

# Convert raw signal to percentage (typical range -100 to -50 dBm)
# /proc/net/wireless gives quality/70 style values; normalize to %
if [ -n "$SIGNAL" ] && [ "$SIGNAL" -gt 0 ] 2>/dev/null; then
    PCT=$((SIGNAL * 100 / 70))
    [ "$PCT" -gt 100 ] && PCT=100
    TEXT="󰤨  ${PCT}%"
    TOOLTIP="${ESSID} · ${PCT}% · ${INET}"
else
    TEXT="󰤨 wifi"
    TOOLTIP="${ESSID} · ${INET}"
fi

printf '{"text":"%s","tooltip":"%s","class":"%s"}\n' "$TEXT" "$TOOLTIP" "$INET_CLASS"
