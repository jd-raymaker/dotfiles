#!/bin/bash
# Source this file in your bashrc

# Open excel files in terminal
# Requires xlsx2csv (Install: pip install xlsx2csv)
function xl() {
	xlsx2csv -d ';' "$1" 2>&1 | column -s';' -t | less -S
}

function setproxy {
	export http_proxy="$1"
	export https_proxy="$1"
}
