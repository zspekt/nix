#!/usr/bin/env bash
tmux split-window -h
tmux send-keys "ssh root@openwrt.lan" Enter
tmux select-pane -t :.+
tmux send-keys "ssh zspekt@nixpi.lan" Enter
