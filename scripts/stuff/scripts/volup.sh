pactl set-sink-volume @DEFAULT_SINK@ +5%
kill -45 $(pidof someblocks)
