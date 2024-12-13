#!/bin/bash

# Open excel files in terminal
# Requires xlsx2csv (Install: pip install xlsx2csv)
function xl() {
	xlsx2csv -d ';' "$1" 2>&1 | column -s';' -t | less -S
}

function setproxy {
	export http_proxy="$1"
	export https_proxy="$1"
}

function unzip-docx {
	unzip -p "$1" word/document.xml | sed -e 's/<[^>]\{1,\}>//g; s/[^[:print:]]\{1,\}//g'
}

function livepaper {
	mpvpaper -s -o "no-audio loop" '*' $1 &
	disown
}
