#!/usr/bin/env bash

# Set wallpaper
feh --bg-scale ~/wallpapers/city.png &

# Network manager
nm-applet --indicator &

# Bluetooth
blueman-applet &

# Status bar (use polybar or waybar)
killall polybar
polybar example &

# Notification daemon
dunst &

# Redshift for night mode
redshift &

# Audio settings
pulseaudio --start &

# Launch player control daemon
playerctl daemon &
