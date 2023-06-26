#!/bin/sh
# See https://wiki.archlinux.org/title/Awesome#Autostart

# Launches polybar for multiple monitors
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload example &
  done
else
  polybar --reload example &
fi

# Set the refresh rate to 144hz. You may need to change the output target. Figure that out with xrandr
xrandr --output DP-2 --mode 2560x1440 --rate 144
xrandr --output DP-4 --mode 2560x1440 --rate 144

exec picom -b --config ~/Extensible/dotfiles/picom/picom.conf

