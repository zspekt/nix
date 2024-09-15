#!/usr/bin/env bash
bluetoothctl connect "$(bluetoothctl devices | awk '{mac=$2; $1=$2=""; gsub(/^[ \t]+|[ \t]+$/, ""); print "󰂯 " $0 " - " mac }' | rofi -dmenu -i -p "Bluetooth 󰂰 : " -fn "JetBrainsMono Nerd Font" -l 10 | awk -F " - " '{print $2}')"
