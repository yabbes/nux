feh --bg-scale Bilder/wallpaper\ bien.jpg
#alsactl init

#logdir=$HOME/var/log/
#mkdir -p "$logdir"
#exec > "$logdir/xinit" 2>&1


xrunning=~/.dwm/isrunning
touch "$xrunning"

cpu_temperatur() {
	echo $(head -c 2 /sys/class/thermal/thermal_zone0/temp)C
}

while [[ -f "$xrunning" ]]; do
	DATUM="$(date '+%R:%S')"
	IPADDR="$(ip addr show enp7s0|grep inet |head -1 | awk '{print $2}')"
	sleep 1
	xsetroot -name "YABBES @ $IPADDR + $DATUM CPU @ $(cpu_temperatur)"
	
done &

