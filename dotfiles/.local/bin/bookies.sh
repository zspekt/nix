#!/usr/bin/env bash

books=$(find "$HOME"/bookies/*)

display_choices=$(echo -e "$books" | awk -F "/" '{  print $NF }')

pick=$(echo -e "$display_choices" | rofi -dmenu -i -p "Read  :")

actual_pick=$(echo -e "$books" | grep "$pick")

exec zathura "$actual_pick"
