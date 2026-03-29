#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 {power|balanced|performance}"
    exit 1
fi

MODE=$1

case $MODE in
    power)
        echo "Activating Ultra Power Saving Mode..."
        powerprofilesctl set power-saver
        
        # Maximize battery: disable eye-candy and enable Variable Frame Rate
        hyprctl --batch "\
            keyword animations:enabled 0;\
            keyword decoration:shadow:enabled 0;\
            keyword decoration:blur:enabled 0;\
            keyword misc:vfr 1"
        ;;
        
    balanced)
        echo "Activating Balanced Mode..."
        powerprofilesctl set balanced
        
        # Restore normal desktop experience
        hyprctl --batch "\
            keyword animations:enabled 1;\
            keyword decoration:shadow:enabled 1;\
            keyword decoration:blur:enabled 1;\
            keyword misc:vfr 1"
        ;;
        
    performance)
        echo "Activating Ultra Performance Mode..."
        powerprofilesctl set performance
        
        # Maximize resources for applications/games
        hyprctl --batch "\
            keyword animations:enabled 0;\
            keyword decoration:shadow:enabled 0;\
            keyword decoration:blur:enabled 0;\
            keyword misc:vfr 0"
        ;;
        
    *)
        echo "Invalid option. Usage: $0 {power|balanced|performance}"
        exit 1
        ;;
esac
