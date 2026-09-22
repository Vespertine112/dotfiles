#!/bin/bash
# Adjusts default sink volume. Called by eww onscroll with "up" or "down".
case "$1" in
    up)   pactl set-sink-volume @DEFAULT_SINK@ +5% ;;
    down) pactl set-sink-volume @DEFAULT_SINK@ -5% ;;
esac
