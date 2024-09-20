#!/usr/bin/env bash
tmux new-window
tmux previous-window
tmux split-window -v -l 10
tmux select-pane -t :.+
tmux send-keys "nvim -c ':lua require('telescope.builtin').find_files({ hidden = true, no_ignore = true, })'" Enter
