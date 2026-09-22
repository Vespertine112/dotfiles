#!/bin/bash
# Returns network status as JSON: {type, name, signal?}

wifi=$(nmcli -t -f active,ssid dev wifi 2>/dev/null | grep '^yes' | cut -d: -f2)
if [[ -n "$wifi" ]]; then
    signal=$(nmcli -t -f in-use,signal dev wifi 2>/dev/null | grep '^\*' | cut -d: -f2)
    printf '{"type":"wifi","name":"%s","signal":"%s"}\n' "$wifi" "${signal:-0}"
    exit
fi

iface=$(ip -o link show up 2>/dev/null | awk -F': ' '!/lo/{print $2}' | head -1)
if [[ -n "$iface" ]]; then
    printf '{"type":"ethernet","name":"%s"}\n' "$iface"
    exit
fi

echo '{"type":"disconnected"}'
