echo " $(sensors | grep 'Tctl' | cut -d ':' -f 2 | tr -d ' +')"
