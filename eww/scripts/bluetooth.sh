#!/bin/bash
# Returns bluetooth status as JSON: {status, device?}

powered=$(bluetoothctl show 2>/dev/null | awk '/Powered:/{print $2}')
if [[ "$powered" != "yes" ]]; then
    echo '{"status":"off"}'
    exit
fi

connected_line=$(bluetoothctl devices Connected 2>/dev/null | head -1)
if [[ -n "$connected_line" ]]; then
    mac=$(echo "$connected_line" | awk '{print $2}')
    alias=$(bluetoothctl info "$mac" 2>/dev/null | awk '/Alias:/{$1=""; sub(/^ /,""); print}')
    printf '{"status":"connected","device":"%s"}\n' "${alias:-$mac}"
    exit
fi

echo '{"status":"on"}'
