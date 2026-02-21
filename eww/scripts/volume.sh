#!/bin/bash
# Streams volume/mute state as JSON. Stays alive via pactl subscribe.

get_volume() {
    local vol muted
    vol=$(pactl get-sink-volume @DEFAULT_SINK@ 2>/dev/null | grep -oP '\d+(?=%)' | head -1)
    muted=$(pactl get-sink-mute @DEFAULT_SINK@ 2>/dev/null | grep -c 'yes')
    printf '{"volume":%s,"muted":%s}\n' "${vol:-0}" "$([ "$muted" -gt 0 ] && echo 'true' || echo 'false')"
}

get_volume

pactl subscribe 2>/dev/null | grep --line-buffered "sink" | while IFS= read -r _; do
    get_volume
done
