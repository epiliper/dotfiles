vol=$(pactl get-sink-volume @DEFAULT_SINK@ | awk 'NR==1 {print; exit}' | cut -d '/' -f 4 | tr -d ' ')
echo "  $vol"
