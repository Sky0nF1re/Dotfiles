#!/bin/bash

# Pull full color JSON
json="$HOME/.cache/wal/colors.json"

# Pick the most vibrant (non-black) from a safe range
for key in color5 color6 color13 color2 color4; do
    color=$(jq -r ".colors.${key}" "$json")
    # Skip super dark greys
    if [[ "$color" != "#0f0d10" && "$color" != "#090909" ]]; then
        break
    fi
done

# Fallback if none found
[[ -z "$color" ]] && color="#1a1a1a"

# Patch the kitty theme
sed -i "s/^background.*/background $color/" ~/.cache/wal/colors-kitty.conf
