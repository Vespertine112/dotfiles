#!/bin/bash
# Streams swaync notification state as JSON {count, dnd, ...}.
# Filters out the initial version handshake line.

swaync-client -swb 2>/dev/null | while IFS= read -r line; do
    echo "$line" | jq -e '.count' >/dev/null 2>&1 && echo "$line"
done
