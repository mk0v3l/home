#!/bin/bash
# echo "red white"
LIGHTBAT=21
LOWBAT=16
CRTICALBAT=11
# colorBat=red

output=$(acpi)
    # percentage=$(echo $output | awk '{print $4}' | tr -d ',%')
    # percentage=$(echo "$output" | tail -n 1 | awk '{gsub(/,/, "", $4); sub(/%/, "", $4); print $4}')
charging=$(echo "$output" | tail -n 1 | awk '{gsub(/,/, "", $3); sub(/%/, "", $3); print $3}')
    # charging=$(echo $output | awk '{print $3}' | tr -d ',%')
percentage=$(echo "$(acpi)" | head -n 1 | awk '{gsub(/[^0-9]/, "", $4); print $4}')

if [ $percentage -lt $CRTICALBAT ]; then
    if [ $charging = "Full" ] || [ $charging = "Charging" ]; then
	# echo "green white"
        echo "light_gray dark_gray"
    else
	echo "red dark_gray"
	fi
else
    if [ $percentage -gt $LOWBAT ]; then
	if [ $charging = "Full" ] || [ $charging = "Charging" ]; then
	    echo "light_gray dark_gray"
	else
	    # echo "red dark_gray"
	    echo "orange dark_gray"
	fi
    else		     
        echo "light_gray dark_gray"
    fi
fi
