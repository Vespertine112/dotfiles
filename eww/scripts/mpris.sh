#!/bin/bash
# Streams MPRIS metadata as JSON via playerctl -F (follow/live updates).
# Falls back to a stopped state if playerctl is unavailable.

playerctl -F metadata \
    --format '{"status":"{{status}}","title":"{{title}}","artist":"{{artist}}","player":"{{playerName}}"}' \
    2>/dev/null || echo '{"status":"Stopped","title":"","artist":"","player":""}'
