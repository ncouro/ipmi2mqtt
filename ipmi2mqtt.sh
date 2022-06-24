#!/bin/sh 
set +eu

# ipmitool sensor | awk -F'|' '$6 ~ /[0-9.]+/ {print $1 $6}'
# ipmitool sensor | awk -F'|' '$1~!/.*na.*/ {print $1 $2}'

# Time all white space
JSON_STRING=$(ipmitool sensor | awk -F'|' '$2~!/.+na.+/ {gsub(/ /, "", $0); print $1 "=" $2}' | jo)
