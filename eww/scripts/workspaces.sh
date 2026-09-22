#!/bin/bash
# Outputs JSON array of workspaces for the given monitor.
# Stays alive, re-emits on Hyprland workspace events.
# Works with hyprsplit: DP-2 = IDs 1-10, DP-3 = IDs 11-20, etc.
MONITOR="${1:-DP-2}"
NUM_WORKSPACES=10

get_workspaces() {
    local mon_index active occupied
    # Get monitor index and active workspace ID
    mon_index=$(hyprctl -j monitors 2>/dev/null | jq --arg mon "$MONITOR" '.[] | {name:.name,id:.id} | select(.name == $mon) | .id')
    active=$(hyprctl -j monitors 2>/dev/null | jq --arg mon "$MONITOR" '.[] | {name:.name,id:.id, aw: .activeWorkspace.id} | select(.name == $mon) | .aw')
    # Get list of occupied workspace IDs on this monitor
    occupied=$(hyprctl -j workspaces 2>/dev/null | jq --arg mon "$MONITOR" '[.[] | select(.monitor == $mon) | .id]')

    local offset=$(( ${mon_index:-0} * NUM_WORKSPACES ))

    # Build full workspace list (all 10 slots), marking active and occupied
    jq -n --argjson active "${active:-0}" \
          --argjson occupied "${occupied:-[]}" \
          --argjson offset "$offset" \
          --argjson num "$NUM_WORKSPACES" \
	-c '[range(1; $num + 1) | . + $offset | {id: ., name: (. - $offset | tostring), active: (. == $active), occupied: (. as $id | $occupied | index($id) != null)}]'
}

get_workspaces

socat -u "UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" - | \
while IFS= read -r line; do
    case "${line%%>>*}" in
        workspace|activewindow|movewindow|openwindow|closewindow|destroyworkspace|createworkspace)
            get_workspaces ;;
    esac
done
