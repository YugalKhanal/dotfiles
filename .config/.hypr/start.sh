#!/usr/bin/env bash

# wallpaper
swww-daemon &
sleep 2
swww img ~/wallpapers/city.png &

# network manager
nm-applet --indicator &
sleep 2

# waybar
killall waybar &
sleep 3
waybar &

sleep 1

# bluetooth
blueman-applet &

sleep 1

# notification daemon
# dunst &
swaync &
sleep 1

redshift &
sleep 1
