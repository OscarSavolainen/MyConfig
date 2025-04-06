#!/bin/bash

sudo apt-get update
sudo apt-get upgrade

## SSH keychain
sudo apt-get install keychain

# Tmux
chmod +x startup.sh
chmod +x tmux-startup.sh

# Pipewire manager used in i3 config
sudo apt install wireplumber

# i3 stuff
sudo apt install picom polybar rofi i3  nitrogen
sudo apt-get install  maim xclip brightnessctl rofi
sudo apt install x11-xserver-utils  # for xrdb
sudo apt install x11-xkb-utils      # for setxkbmap
