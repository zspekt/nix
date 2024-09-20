#!/usr/bin/env bash
tmux split-window -h
ssh root@openwrt.lan
tmux select-pane -t :.+
ssh zspekt@nixpi.lan
