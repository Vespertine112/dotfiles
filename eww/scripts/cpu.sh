#!/bin/bash
# Returns integer CPU usage percentage, computed from two /proc/stat samples.
read -ra s1 < <(grep '^cpu ' /proc/stat)
sleep 0.1
read -ra s2 < <(grep '^cpu ' /proc/stat)

d_total=$(( (s2[1]+s2[2]+s2[3]+s2[4]+s2[5]+s2[6]+s2[7]) - (s1[1]+s1[2]+s1[3]+s1[4]+s1[5]+s1[6]+s1[7]) ))
d_idle=$(( s2[4] - s1[4] ))

if [[ $d_total -eq 0 ]]; then echo 0; else echo $(( (d_total - d_idle) * 100 / d_total )); fi
