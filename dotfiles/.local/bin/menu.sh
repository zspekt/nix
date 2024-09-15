#!/usr/bin/env bash
# var=$(find "$HOME"/.local/bin/*.sh | rofi -dmenu -i -l 30 -p "Run ")
#
# exec "$var"
exec "$(find "$HOME"/.local/bin/*.sh | rofi -dmenu -i -p "Run ")"
