#!/bin/bash

WORKINGDIR="$HOME/.config/rofi/"
MAP="$WORKINGDIR/menu.csv"

cat "$MAP" \
    | cut -d ',' -f 1 \
    | rofi -dmenu -i -config "$WORKINGDIR/config.rasi" -p "" \
    | head -n 1 \
    | xargs -i --no-run-if-empty grep "{}" "$MAP" \
    | cut -d ',' -f 2 \
    | head -n 1 \
    | xargs -i --no-run-if-empty /bin/bash -c "{}"

exit 0

