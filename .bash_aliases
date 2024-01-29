# Set up git alias for dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Browsing
alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -la'

# System
alias up='sudo pacman -Syu'
alias upall='yay -Syu'
alias algo='sudo systemctl start wg-quick@wg0'
alias algo-stop='sudo systemctl stop wg-quick@wg0'
alias loopback='sudo modprobe v4l2loopback'

# Git
alias gfp='git fetch --prune'
alias gbd='git branch | grep -v 'main' | xargs git branch -D'

# Applications
alias vim='nvim'
alias vi='nvim'
alias ra='ranger'
alias cal='cal -m'

# Jekyll
alias jserve='bundle exec jekyll serve --livereload'

# Find Top 10 largest files
alias top10='find . -type f -printf "%s %p\n" | sort -nr | head -10'

# Play video in vr
alias vrvideo='vr-video-player $(xdotool selectwindow)'
