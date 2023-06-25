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

exec picom -b --config ~/Extensible/dotfiles/picom.conf