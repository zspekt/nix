#!/usr/bin/env bash
pick=$(
	sesh list -i |               # -i flag == icons
		sed 's/\x1b\[[0-9;]*m//g' | # regex to striop off ansi color codes
		rofi -ansi -dmenu -p "tmux  :" |
		awk '{ print $2 }'
)

if [[ -z "$pick" ]]; then
	exit
fi

exec kitty --execute sesh connect "$pick"
