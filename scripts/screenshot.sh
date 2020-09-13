#!/bin/bash

# Working folder
wf=$HOME/Pictures/screenshots/

# Filename to save
F=$wf$(date +%Y%m%d-%H%M%S.png)

# Working directory exist?
if [ ! -d "$wf" ]; then
	# Create folder
	mkdir -p $wf
fi

scrot -s "$F"

# Bonus - copy image to clipboard
xclip -sel clip -t $(file -b --mime-type "$F") < "$F"
