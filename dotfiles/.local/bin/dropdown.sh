#!/usr/bin/env bash

# if [[ $"$(hyprctl activewindow -j | jq -r ".class")" == "dropdown" ]]; then
# 	hyprctl dispatch killactive ""
# else
# 	kitty --override background_opacity=0.8 --class 'dropdown' -e zsh -c "tmux -u new-session -A -s dropdown"
# fi
#
#
kitty --override background_opacity=0.6 --class dropdown -e zsh -c "tmux -u new-session -A -s dropdown"
