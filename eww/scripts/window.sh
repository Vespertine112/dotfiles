#!/bin/bash
# Outputs the active window title.
# Stays alive, re-emits on Hyprland activewindow events.

hyprctl -j activewindow | jq -r '.title // ""'

socat -u "UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" - | \
while IFS= read -r line; do
    [[ "${line%%>>*}" == "activewindow" ]] && hyprctl -j activewindow | jq -r '.title // ""'
done
