#!/usr/bin/env bash
choices=$(pactl list sinks short | awk '{ print $2 }')
var=$(echo -e "$choices" | rofi -format 'd' -dmenu -i -p "Sinks 󰋋 :")

exec pactl set-default-sink "$var"
