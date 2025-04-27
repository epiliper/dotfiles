if [ ! $(pidof wlsunset) > /dev/null ]; then
  ddcutil setvcp 10 40
	wlsunset -t 1500 -T 3500 &
else 
  ddcutil setvcp 10 80
	pkill wlsunset
fi
kill -44 $(pidof someblocks)
