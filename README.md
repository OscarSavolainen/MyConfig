Some setup:


## Useful packages
```bash
chmod +x scripts/installs.sh
```


## Key remapping
Caps -> Escape
```bash
sudo mkdir -p /etc/X11/xorg.conf.d/
sudo vim /etc/X11/xorg.conf.d/00-keyboard.conf
```
Add this:
```
Option "XkbOptions" "caps:escape"
```
e.g.
```
Section "InputClass"
        Identifier "system-keyboard"
        MatchIsKeyboard "on"
        Option "XkbLayout" "gb"
        Option "XkbVariant" ""
        Option "XkbOptions" "caps:escape"
EndSection
```


## Startup Script
```bash
# Symlimk to home
ln -s ~/.startup.sh /home/oscar/Coding/Mine/MyConfig/scripts/startup.sh
chmod +x ~/.startup.sh
```
Create a systemctl file that will launch at startup:
```bash
sudo vim /etc/systemd/system/my-startup-script.service
```
Paste the following in:
```
[Unit]
Description=My Startup Script
After=network.target

[Service]
Type=simple
ExecStart=~/.startup.sh
User=oscar

[Install]
WantedBy=multi-user.target
```
Then enable it:
```bash
sudo systemctl daemon-reload    
sudo systemctl enable my-startup-script.service
sudo systemctl start my-startup-script.service
```
Either reboot to check the startup script, or just check the systemd service status:
```bash
sudo systemctl status my-startup-script.service
```


## Config files:
Go to config-files and follow the README.


## Tmux startup
I like to have some tabs open automatically when I start tmux.
```bash
ln -s /home/oscar/Coding/Mine/MyConfig/scripts/tmux-startup.sh ~/.tmux-startup.sh
```
Then our .zshrc file should execute it at startup.


## i3
```bash
ln -s /home/oscar/Coding/Mine/MyConfig/i3/config/i3 ~/.config/i3
ln -s /home/oscar/Coding/Mine/MyConfig/i3/polybar ~/.config/polybar
ln -s /home/oscar/Coding/Mine/MyConfig/i3/picom ~/.config/picom
ln -s /home/oscar/Coding/Mine/MyConfig/i3/rofi ~/.config/rofi
chmod +x ~/.config/polybar/launch_polybar.sh
```
