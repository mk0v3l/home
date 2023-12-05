#!/bin/bash

file='/home/mkovel/.speed'
speed=$(cat "$file" 2>/dev/null || echo "0")

if [[ $speed -eq 0 ]]; then
	gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 20
	gsettings set org.gnome.desktop.peripherals.keyboard delay 100
	echo "1" >"$file"
else
	gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 30
	gsettings set org.gnome.desktop.peripherals.keyboard delay 300
	echo "0" >"$file"
fi

# is_fast=$FAST
# if [[ $is_fast -eq 1 ]]; then
# 	gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 20
# 	gsettings set org.gnome.desktop.peripherals.keyboard delay 300
# 	export FAST=0
# else
# 	gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 30
# 	gsettings set org.gnome.desktop.peripherals.keyboard delay 600
# 	export FAST=1
# fi

# gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 20
# gsettings set org.gnome.desktop.peripherals.keyboard delay 300
