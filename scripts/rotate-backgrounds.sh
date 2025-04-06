#!/bin/bash

# Directory containing backgrounds (with proper expansion)
BG_DIR="$HOME/Pictures/Backgrounds"

# Get a random image from the directory
RANDOM_BG=$(find "$BG_DIR" -type f \( -name "*.jpg" -o -name "*.png" \) | shuf -n 1)

# Check if we found an image
if [ -z "$RANDOM_BG" ]; then
    echo "No background images found in $BG_DIR" >> ~/bg-rotation.log
    exit 1
fi

# Set the background using nitrogen
nitrogen --set-scaled "$RANDOM_BG" --save

# For debugging
echo "Set background to: $RANDOM_BG" >> ~/bg-rotation.log
