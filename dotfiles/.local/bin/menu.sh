#!/usr/bin/env bash
exec "$(find "$HOME"/.local/bin/*.sh | rofi -dmenu -i -p "Run  :")"
