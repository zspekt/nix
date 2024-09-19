#!/usr/bin/env bash
pick=$(tmuxinator list --newline | sed '1d' | rofi -dmenu -p "tmux  :")

if [[ -z "$pick" ]]; then
	exit
fi

exec kitty --execute tmuxinator start "$pick"
