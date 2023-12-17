white='#f8f8f2'
gray='#44475a'
dark_gray='#282a36'
light_purple='#bd93f9'
dark_purple='#6272a4'
cyan='#8be9fd'
green='#50fa7b'
orange='#ffb86c'
red='#ff5555'
red2='#ff8b8b'
pink='#ff79c6'
yellow='#f1fa8c'
brown='#d6af73'
brown='#e5aa70'

bat0="#[fg=$red]"
bat25="#[fg=$red] "
bat50="#[fg=$orange] "
bat75="#[fg=$green] "
bat100="#[fg=$green] "
bat0c="#[fg=$yellow]#[fg=$red]"
bat25c="#[fg=$yellow]#[fg=$red]"
bat50c="#[fg=$yellow]#[fg=$orange]"
bat75c="#[fg=$yellow]#[fg=$green]"
bat100c="#[fg=$yellow]#[fg=$green]"
bat100ok="#[fg=$green]"

cal="#[fg=$red]󰸗 #[fg=$dark_gray]"
sunrise="#[fg=$orange]󰖜 #[fg=$dark_gray]"
sunset="#[fg=$orange]󰖛 #[fg=$dark_gray]"
sun="#[fg=$yellow] #[fg=$dark_gray]"
moon="#[fg=$cyan]󰖔 #[fg=$dark_gray]"
cloudday="#[fg=$yellow] #[fg=$dark_gray]"
cloudnight="#[fg=$cyan]󰼱 #[fg=$dark_gray]"
rainday="#[fg=$yellow] #[fg=$dark_gray]"
rainnight="#[fg=$cyan] #[fg=$dark_gray]"
showerday="#[fg=$yellow] #[fg=$dark_gray]"
showernight="#[fg=$cyan] #[fg=$dark_gray]"
snowday="#[fg=$yellow] #[fg=$dark_gray]"
snownight="#[fg=$cyan] #[fg=$dark_gray]"
overcastday="#[fg=$yellow] #[fg=$dark_gray]"
overcastnight="#[fg=$cyan]󰼱 #[fg=$dark_gray]"
err="#[fg=$red] #[fg=$dark_gray]"
question="#[fg=$red2] #[fg=$dark_gray]"
therm="#[fg=$red2]#[fg=$dark_gray]"
rabbit="#[fg=$brown]󰤇 #[fg=$dark_gray]"
tortoise="#[fg=$green]󰴻 #[fg=$dark_gray]"
nowifi="#[fg=$red]󰖪 #[fg=$dark_gray]"
# 󰖑
fogday="#[fg=$yellow]󰖑 #[fg=$dark_gray]"
fognight="#[fg=$cyan]󰖑 #[fg=$dark_gray]"
# 

# brown='#693d10'
# brown='#ca6600'
# 693d10
# rabbit='󰤇'
# nowifi="#[fg=$red]󰤨 #[fg=$dark_gray]"
# 󰤇󰴻󰖪
dirr=$(~/.tmux/plugins/tmux/scripts/dir.sh)
now=$(date +%H)
giit=$(~/.tmux/plugins/tmux/scripts/git.sh)
cur_speed=$(cat ~/.speed) #  possible value : 0 and 1
today=$(date +%d/%m)
hour=$(date +%H:%M)
temperature=$(curl -sL wttr.in/$fixedlocation\?format="%C+%t$display_weather" | rev | cut -d ' ' -f 1 | rev | sed 's/+//g' | sed 's/C//g')

if [ $cur_speed -eq 0 ]; then
	speed=$tortoise
else
	speed=$rabbit
fi

[ $(date +%H) -gt 6 -a $(date +%H) -lt 18 ] && DAY=true || DAY=false
weather_condition=$(curl -sL wttr.in\?format="%C+%t" | rev | cut -d ' ' -f2- | rev | awk '{print tolower($0)}')

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

status=$(linux_acpi2 status)
case $status in
discharging | Discharging)
	if [ $(battery_percent) -gt 99 ]; then
		bat=$bat100ok
		colbat=$green
	elif [ $(battery_percent) -gt 75 ]; then
		bat=$bat100
		colbat=$green
	elif [ $(battery_percent) -gt 50 ]; then
		bat=$bat75
		colbat=$green
	elif [ $(battery_percent) -gt 25 ]; then
		bat=$bat50
		colbat=$orange
	elif [ $(battery_percent) -gt 10 ]; then
		bat=$bat25
		colbat=$red
	else
		bat=$bat0
		colbat=$red
	fi
	;;
high | Full)
	if [ $(battery_percent) -gt 99 ]; then
		bat=$bat100ok
		colbat=$green
	elif [ $(battery_percent) -gt 80 ]; then
		bat=$bat100c
		colbat=$green
	fi
	;;
charging | Charging)
	if [ $(battery_percent) -ge 95 ]; then
		bat=$bat100ok
		colbat=$green
	elif [ $(battery_percent) -gt 75 ]; then
		bat=$bat100c
		colbat=$green
	elif [ $(battery_percent) -gt 50 ]; then
		bat=$bat75c
		colbat=$green
	elif [ $(battery_percent) -gt 25 ]; then
		bat=$bat50c
		colbat=$orange
	elif [ $(battery_percent) -gt 10 ]; then
		bat=$bat25c
		colbat=$red
	else
		bat=$bat0c
		colbat=$red
	fi
	;;
*)
	colbat=$green
	;;
esac

if [ $now -ge 6 -a $now -lt 8 ]; then
	label=$sunrise
elif [ $now -ge 8 -a $now -lt 18 ]; then
	label=$sun
elif [ $now -ge 18 -a $now -lt 20 ]; then
	label=$sunset
else
	label=$moon
fi

case $weather_condition in
*cloud*)
	if $DAY; then
		cond=$cloudday
	else
		cond=$cloudnight
	fi
	;;
*clear* | *sunny*)
	if $DAY; then
		cond=$sun
	else
		cond=$moon
	fi
	;;
*rain*)
	if $DAY; then
		cond=$rainday
	else
		cond=$rainnight
	fi
	;;
*shower*)
	if $DAY; then
		cond=$showerday
	else
		cond=$showernight
	fi
	;;
*snow*)
	if $DAY; then
		cond=$snowday
	else
		cond=$snownight
	fi
	;;
# overcast or mist
*overcast* | *mist* | *fog*)
	# *overcast*)
	if $DAY; then
		cond=$fogday
	else
		cond=$fognight
	fi
	;;

# *mist*)
# 	if $DAY; then
# 		cond=$overcastday
# 	else
# 		cond=$overcastnight
# 	fi
# 	;;

*NA*)
	cond=$err
	#
	;;
*)
	cond=$question
	;;
esac
# ${${(%):-%~}}
# bat_stat=$(battery_status)
# bsd="#[fg=$green]#[bg=$green]#[fg=$dark_gray]ד״סב"
bsd="#[fg=$colbat]#[bg=$colbat]#[fg=$dark_gray]ד״סב"
if ping -q -c 1 -W 1 ipinfo.io >/dev/null; then
	echo "$dirr#[bg=$gray]$giit#[fg=$dark_purple]#[bg=$dark_purple]$speed$cal$today $cond$temperature$therm $hour$bat $bsd"

	# PROMPT="%F{green}󰞦%{$reset_color%}%f%B"
	# export PROMPT="yo"
else
	echo "$dirr#[bg=$gray]$giit#[fg=$dark_purple]#[bg=$dark_purple]$speed$cal$today $nowifi$hour$bat $bsd"
	# echo "$cal$today $err$hour$bat"
	# echo "$cal$today $nowifi$hour$bat"
fi
