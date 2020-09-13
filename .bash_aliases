# Set up git alias for dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Browsing
alias ll='ls -l'
alias la='ls -la'

# Find Top 10 largest files
alias top10='find . -type f -printf "%s %p\n" | sort -nr | head -10'

# Play video in vr
alias vrvideo='vr-video-player $(xdotool selectwindow)'
