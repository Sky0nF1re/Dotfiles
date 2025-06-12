#!/bin/bash
exec > /tmp/wallpaper-debug.log 2>&1
set -x

DIR="$HOME/Pictures/Wallpapers"
LOG="$HOME/.config/scripts/wallpaper-menu.log"

# Select with Wofi
SELECTED=$(ls "$DIR" | /usr/bin/wofi --show dmenu --prompt "Wallpapers")

# Exit if nothing picked
[ -z "$SELECTED" ] && echo "No selection made" >> "$LOG" && exit 1

FULLPATH="$DIR/$SELECTED"

# Log and link
echo "Selected: $FULLPATH" >> "$LOG"
ln -sf "$FULLPATH" "$DIR/current.jpg"

# Restart Hyprpaper
killall hyprpaper
sleep 0.2
hyprpaper -c ~/.config/hyprpaper/hyprpaper.conf &

wal -i "$FULLPATH" -b dark -c -n --backend haishoku
~/.config/scripts/smart-kitty-bg.sh
killall waybar
waybar &
