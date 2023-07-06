#!/bin/bash

dunst &
lxsession -a &
nitrogen --restore & 
nvidia-settings -l &
udiskie -s &
xcompmgr -c -C -n &
sh /$HOME/.config/conky/launch.sh &

# Run status bar
bash $HOME/.local/share/dwm/dwm_status &
