# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
# Enable tab completion
source ~/git-completion.bash

# colors!
green="\[\033[0;32m\]"
blue="\[\033[0;34m\]"
purple="\[\033[0;35m\]"
reset="\[\033[0m\]"

# Change command prompt
source ~/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
# '\u' adds the name of the current user to the prompt
# '\$(__git_ps1)' adds git-related stuff
# '\W' adds the name of the current directory
export PS1="$purple\u$green\$(__git_ps1)$blue \W $ $reset"

# Prompts Fedora logo and system info. on startup
#screenfetch

## Creation of personal functions and aliases
# Aliases
alias lsl="ls -lhFA | less"
alias ll="ls -lhA"
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"
alias mkdir="mkdir -pv"
alias py="python3"

# Functions
mkcd () {
    mkdir -p $1
    cd $1
}

octcl (){
   octave --no-gui
}

lsd (){
  sh ~/Documents/dev/latex/shit_deleter.sh
}

briss (){
  java -jar /opt/briss/briss-0.9.jar 
}
