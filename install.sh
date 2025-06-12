#!/bin/bash

echo "Linking Hyprland setup..."

CONFIGS=("hypr" "waybar" "hyprpaper" "scripts")

for item in "${CONFIGS[@]}"; do
    echo "Linking $item..."
    rm -rf "$HOME/.config/$item"
    ln -s "$HOME/dotfiles/$item" "$HOME/.config/$item"
done

echo "Done! Hyprland configs are live ✨"
