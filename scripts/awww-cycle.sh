#!/bin/bash

# Define the directory and the interval (in seconds)
WALLPAPER_DIR="/home/darriour/Pictures/Wallpaper"
INTERVAL=200 

while true; do
    # Find all images in the folder and pick a random one
    IMG=$(find "$WALLPAPER_DIR" -type f \( -iname \*.jpg -o -iname \*.png -o -iname \*.jpeg \) | shuf -n 1)
    
    # Apply the wallpaper with a smooth transition
    # You can change the transition-type to: simple, fade, left, right, top, bottom, wipe, wave, grow, center
   # ... inside the while loop ...
	awww img "$IMG" --transition-fps 60 --transition-type random --transition-duration 2

	# Create a symlink to the current wallpaper
	ln -sf "$IMG" /home/darriour/Pictures/Wallpaper/current_wallpaper
	# ...    # Wait for the specified interval before changing again
    sleep $INTERVAL
done
