#!/bin/bash

# Working folder
wf=$HOME/Pictures/screenshots/

# Filename to save
filename=$(date +%Y%m%d-%H%M%S.png)

# Working directory exist?
if [ ! -d "$wf" ]; then
	# Create folder
	mkdir $wf
fi

scrot -s '%Y%m%d-%H%M%S.png' -e 'mv $f ~/Pictures/screenshots'
