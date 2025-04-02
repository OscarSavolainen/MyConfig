#!/bin/bash
# A startup script to run when I boot up my computer

# Keymappings
xmodmap ~/.Xmodmap

# Launch minimize_window, it automatically minimizes any window I am
# not focused on (so that with my transparent alactritty I can see my
# desktop background)
# EDIT: this is now managed via supervisorctl, so that's it always running in the background
# ./minimize-windows/min_window_driver.sh
# ./minimize-windows/driver.sh

# Open Firefox
firefox &

# Open terminal
ghostty &

# # Open Bluetooth settings
# gnome-control-center bluetooth &

# Slack
slack &

# Thunderbird
thunderbird &

# Connect to bluetooth headphones
python connect-bluetooth.py
# ./connect-bluetooth-headphones.sh

# NordVPN
norvpn set autoconnect on
nordvpm connect UnitedKingdom

# Add SSH key via keychain
eval "$(keychain --eval --quiet ~/.ssh/id_ed25519)"
