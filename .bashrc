#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

function _update_ps1() {
	# Run powerline-shell if exist. If not, then use default PS1
	powerline-shell > /dev/null 2>&1 && PS1=$(powerline-shell $?) || PS1='[\u@\h \W]\$ '
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$HOME/.local/share/gem/ruby/3.0.0/bin/:$PATH"

# Include bash config files
source $HOME/.bash_aliases
source $HOME/.bash_functions

