#!/bin/bash

echo "Starting dunst"
dunst &
echo "Starting lxsession"
lxsession &
echo "Restoring nitrogen wallpaper"
nitrogen --restore &> /dev/null
echo "Loading nvidia settings"
nvidia-settings -l &

# Run pulseaudio as daemon if no pid is returned
echo "Fixing pulseaudio daemon"
pidof pulseaudio || pulseaudio -D &
