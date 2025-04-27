#!/bin/bash

cmd="$1"
cur=$(ddcutil getvcp 10 | sed 's/.*current value = *\([0-9]*\).*/\1/')

if [ "$cmd" = "0" ]; then
    new_value=$((cur + 10))
else
    new_value=$((cur - 10))
fi

ddcutil setvcp 10 $new_value
kill -44 $(pidof someblocks)
