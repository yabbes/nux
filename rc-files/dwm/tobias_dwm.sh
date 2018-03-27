feh --bg-scale Bilder/wallpaper\ bien.jpg
alsactl init
sudo pkill -9 mpd && mpd

while true; do
	DATUM="$(date)"

	sleep 1
	xsetroot -name "YABBES @ $DATUM"
done &

