# Set up git alias for dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Browsing
alias ll='ls -l'
alias la='ls -a'

# Adding speeds for pentesting needs
alias tip='ip addr show tun0 | grep -e "inet\s"' # Show VPN IP
alias thm='sudo openvpn $HOME/JayDee.ovpn' # Connect to tryhackme.com
