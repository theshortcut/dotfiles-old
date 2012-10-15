#PATH
export PATH=":/usr/local/bin:/usr/local/sbin:$PATH"

#Colored ls
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

export EDITOR=vim

#aliases
alias la="ls -a"
alias l="ls -la"
alias ..="cd .."
alias ps="ps -cU `whoami`"

#prompt
GREEN="\[\033[1;32m\]"
RESET="\[\033[0m\]"
export PS1="$GREEN\W$RESET\$ "
export PS2='> '

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
