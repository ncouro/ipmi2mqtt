#!/bin/sh 
set +eu

IPMI_HOST_IP="$1"
SLEEP_PERIOD="$2"

# ipmitool sensor | awk -F'|' '$6 ~ /[0-9.]+/ {print $1 $6}'
# ipmitool sensor | awk -F'|' '$1~!/.*na.*/ {print $1 $2}'

while true; do
	# Time all white space
	JSON_STRING=$(ipmitool sensor | awk -F'|' '$2~!/.+na.+/ {gsub(/ /, "", $0); print $1 "=" $2}' | jo)
	echo ${JSON_STRING}
	mosquitto_pub -h "${IPMI_HOST_IP} -t "ipmi/state" -m "${JSON_STRING}"
	sleep $SLEEP_PERIOD
done
exit $?
