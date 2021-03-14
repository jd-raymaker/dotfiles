#!/bin/bash

dunst &
lxsession &
nitrogen --restore &> /dev/null
nvidia-settings -l &
udiskie -s &

# Run pulseaudio as daemon if no pid is returned
pidof pulseaudio || pulseaudio -D &

# Run status bar
bash $HOME/.local/share/dwm/dwm_status &
