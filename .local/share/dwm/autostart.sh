#!/bin/bash

dunst &
lxsession &
nitrogen --restore & 
nvidia-settings -l &
udiskie -s &
xcompmgr -c -C -n &

# Run status bar
bash $HOME/.local/share/dwm/dwm_status &
