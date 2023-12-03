# now=$
# Retrun " %R 󰸗 %d/%m" if it's day time, otherwise return " %R 󰸗 %d/%m"
# [ $now -gt 6 -a $now -lt 18 ] && echo "#[fg=colour250]#[fg=colour250] %R 󰸗 %d/%m" || echo "#[fg=colour250]#[fg=colour250] %R 󰸗 %d/%m"
# "󰖔 %R 󰸗 %d/%m"
#
# day=" %R 󰸗 %d/%m"
# day=" %R 󰸗 %d/%m"
# night=" %R 󰸗 %d/%m"
# cal="󰸗"
# moon="󰖔"
# sun=""

linux_acpi2() {
	arg=$1
	BAT=$(ls -d /sys/class/power_supply/BAT* | head -1)
	if [ ! -x "$(which acpi 2>/dev/null)" ]; then
		case "$arg" in
		status)
			cat $BAT/status
			;;

		percent)
			cat $BAT/capacity
			;;

		*) ;;
		esac
	else
		case "$arg" in
		status)
			acpi | cut -d: -f2- | cut -d, -f1 | tr -d ' '
			;;
		percent)
			acpi | cut -d: -f2- | cut -d, -f2 | tr -d '% '
			;;
		*) ;;
		esac
	fi
}
battery_percent() {
	percent=$(linux_acpi2 percent)
	[ -n "$percent" ] && echo " $percent"
}

# red='#ff5555'
white='#f8f8f2'
gray='#44475a'
dark_gray='#282a36'
light_purple='#bd93f9'
dark_purple='#6272a4'
cyan='#8be9fd'
green='#50fa7b'
orange='#ffb86c'
red='#ff5555'
pink='#ff79c6'
yellow='#f1fa8c'

# bat75c="#[fg=$yellow]#[fg=$green] #[fg=$dark_gray]"
bat0="#[fg=$red] "
bat25="#[fg=$red] "
bat50="#[fg=$orange] "
bat75="#[fg=$green] "
bat100="#[fg=$green] "
bat0c="#[fg=$yellow]#[fg=$red]"
bat25c="#[fg=$yellow]#[fg=$red]"
bat50c="#[fg=$yellow]#[fg=$orange]"
bat75c="#[fg=$yellow]#[fg=$green]"
# bat75c="#[fg=$yell"
bat100c="#[fg=$yellow]#[fg=$green]"
bat100ok="#[fg=$green]"

# bat0="#[fg=$red]  #[fg=$dark_gray]"
# bat25="#[fg=$red]  #[fg=$dark_gray]"
# bat50="#[fg=$orange]  #[fg=$dark_gray]"
# bat75="#[fg=$green]  #[fg=$dark_gray]"
# bat100="#[fg=$green]  #[fg=$dark_gray]"
# bat0c="#[fg=$yellow]#[fg=$red] #[fg=$dark_gray]"
# bat25c="#[fg=$yellow]#[fg=$red] #[fg=$dark_gray]"
# bat50c="#[fg=$yellow]#[fg=$orange] #[fg=$dark_gray]"
# bat75c="#[fg=$yellow]#[fg=$green]"
# bat100c="#[fg=$yellow]#[fg=$green] #[fg=$dark_gray]"
# bat100ok="#[fg=$green] #[fg=$dark_gray]"

# echo "#[fg=$green] #[fg=$dark_gray]"
# echo "#[fg=$green] #[fg=$dark_gray]"
# echo "#[fg=$orange] #[fg=$dark_gray]"
# echo "#[fg=$red] #[fg=$dark_gray]"
# echo "#[fg=$red] #[fg=$dark_gray]"
# echo "#[fg=$yellow]#[fg=$red] #[fg=$dark_gray]"
# echo "#[fg=$yellow]#[fg=$red] #[fg=$dark_gray]"
# echo "#[fg=$yellow]#[fg=$orange] #[fg=$dark_gray]"
# echo "#[fg=$yellow]#[fg=$green] #[fg=$dark_gray]"
# echo "#[fg=$yellow]#[fg=$green] #[fg=$dark_gray]"
# echo "#[fg=$green] #[fg=$dark_gray]"
# battery_status() {
status=$(linux_acpi2 status)
case $status in
discharging | Discharging)
	if [ $(battery_percent) -gt 99 ]; then
		bat=$bat100ok
		# echo ''
	elif [ $(battery_percent) -gt 75 ]; then
		bat=$bat100
		# echo "#[fg=$green]  #[fg=$dark_gray]"
	elif [ $(battery_percent) -gt 50 ]; then
		bat=$bat75
		# echo "#[fg=$green]  #[fg=$dark_gray]"
	elif [ $(battery_percent) -gt 25 ]; then
		bat=$bat50
		# echo "#[fg=$orange]  #[fg=$dark_gray]"
	elif [ $(battery_percent) -gt 10 ]; then
		bat=$bat25
		# echo "#[fg=$red]  #[fg=$dark_gray]"
	else
		bat=$bat0
		# echo "#[fg=$red]  #[fg=$dark_gray]"
	fi
	;;
high | Full)
	if [ $(battery_percent) -gt 99 ]; then
		bat=$bat100ok
		# echo ''
	elif [ $(battery_percent) -gt 80 ]; then
		# echo "#[fg=$green] #[fg=#282a36]"
		bat=$bat100c
		# echo "#[fg=$yellow]#[fg=$green] #[fg=$dark_gray]"
	fi
	;;
	# echo $status
	# Full)
	# echo ''
	# echo $status
	# ;;
charging | Charging)
	if [ $(battery_percent) -gt 99 ]; then
		bat=$bat100ok
		# echo "#[fg=$green] #[fg=$dark_gray]"
		# echo ''
	elif [ $(battery_percent) -gt 75 ]; then
		# echo ''
		bat=$bat100c
		# echo "#[fg=$yellow]#[fg=$green] #[fg=$dark_gray]"
		# echo "#[fg=colour250] #[fg=colour250]"
		# echo "#[fg=colour250]"
		# 
	elif [ $(battery_percent) -gt 50 ]; then
		# echo ''
		# echo $bat75
		bat=$bat75c

		# echo "#[fg=$yellow]#[fg=$green] #[fg=$dark_gray]"
	elif [ $(battery_percent) -gt 25 ]; then
		bat=$bat50c
		# echo "#[fg=$yellow]#[fg=$orange] #[fg=$dark_gray]"
		# echo ''
	elif [ $(battery_percent) -gt 10 ]; then
		bat=$bat25c
		# echo "#[fg=$yellow]#[fg=$red] #[fg=$dark_gray]"
		# echo ''
	else
		bat=$bat0c
		# echo "#[fg=$yellow]#[fg=$red] #[fg=$dark_gray]"
		# echo ''
	fi
	# echo '⚡'
	;;
*)
	echo 'AC'
	;;
esac
# echo $bat

# }

today=$(date +%d/%m)
hour=$(date +%H:%M)
# 󰖛󰖜󰖨󰖔
# cal="󰸗"
cal="#[fg=$red]󰸗 #[fg=$dark_gray]"
sunrise="#[fg=$orange]󰖜 #[fg=$dark_gray]"
sunset="#[fg=$orange]󰖛 #[fg=$dark_gray]"
sun="#[fg=$yellow]#[fg=$dark_gray]"
moon="#[fg=$cyan]󰖔#[fg=$dark_gray]"

# sunrise='󰖜'
# sunset='󰖛'
# moon="#[fg=$yellow] #[fg=$cyan]"
# moon="#[fg=$orange]󰖜 #[fg=$cyan]"
# day='󰖨'

# sunrise=6->8
# day=8->18
# sunset=18->20
# night=20->6

now=$(date +%H)
if [ $now -gt 6 -a $now -lt 8 ]; then
	label=$sunrise
elif [ $now -gt 8 -a $now -lt 18 ]; then
	label=$sun
elif [ $now -gt 18 -a $now -lt 20 ]; then
	label=$sunset
else
	label=$moon
fi

bat_stat=$(battery_status)
# bat_perc=$(battery_percent)
# bat= $bat_stat + $bat_perc%
# bat= $bat_stat $bat_perc%

# echo "$label $hour $cal $today #[fg=colour250]$bat_stat $bat_perc%"
# echo "$label $hour $cal $today $bat_stat$bat_perc%"
# echo "$bat_stat $hour $label $cal $today"
# echo "$hour $label #[fg=$red]$cal#[fg=$dark_gray] $today $bat_stat"
# echo "$hour $label #[fg=$red]$cal#[fg=$dark_gray] $today $bat_stat"
# echo "$label $hour $cal$today $bat_stat"
# echo "$label $hour $cal$today$bat"
echo "$cal$today $label $hour$bat"

# after 20 heour
# now=$(date +%H)
# echo $now
# ret_val=$night
# echo "#[fg=colour250]$moon $hour $cal $today"
# ret_val=$day
#
# if [ $(date +%H) -gt 20 ]; then
# 	echo "$moon $hour $cal $today"
# else
# 	echo "#[fg=colour250]$sun $hour $cal $today"
# fi
