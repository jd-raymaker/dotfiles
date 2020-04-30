```
   ____   ___ _____ _____ ___ _     _____ ____  
  |  _ \ / _ \_   _|  ___|_ _| |   | ____/ ___| 
  | | | | | | || | | |_   | || |   |  _| \___ \ 
 _| |_| | |_| || | |  _|  | || |___| |___ ___) |
(_)____/ \___/ |_| |_|   |___|_____|_____|____/ 

```

## Applications

 - i3-gaps      https://github.com/Airblader/i3
 - polybar      https://github.com/jaagr/polybar
 - rofi         https://github.com/davatorium/rofi
 - rofi-calc	https://github.com/svenstaro/rofi-calc
 - compton      https://github.com/chjj/compton
 - dunst        https://github.com/dunst-project/dunst
 - xrandr       https://wiki.archlinux.org/index.php/Xrandr
 - neovim	https://github.com/neovim/neovim/wiki/Installing-Neovim
 - vim-plug	https://github.com/junegunn/vim-plug
 - i3lock
 - nitrogen
 - scrot
 - ranger
 - rxvt-unicode

## Installation
Installation script: https://gist.github.com/jd-raymaker/d9e0ebb53f75a82b74ab99f044635f34
```bash
#!/bin/bash
git clone --bare https://github.com/jd-raymaker/dotfiles.git $HOME/.cfg
function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no
```
