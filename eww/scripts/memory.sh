#!/bin/bash
# Returns integer memory usage percentage.
awk '/MemTotal/{t=$2} /MemAvailable/{a=$2} END{printf "%d", (t-a)*100/t}' /proc/meminfo
