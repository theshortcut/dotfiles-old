#PATH
export PATH="/Users/clay/.cabal/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/sbin:$PATH"

#Colored ls
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

export EDITOR=vim

#aliases
alias la="ls -a"
alias l="ls -la"
alias ..="cd .."
alias ps="ps -cU `whoami`"
alias archssh="ssh clay@192.168.1.99"
alias cf.com="ssh cferris@claytonferris.com"
alias pwn3r="ssh clay@pwn3r.org"
alias syncmusic='rsync -Cavvz --progress --delete ~/Music/iTunes\ Music/ clay@192.168.1.99:Music/'

#prompt
GREEN="\[\033[1;32m\]"
RESET="\[\033[0m\]"
export PS1="$GREEN\W$RESET\$ "
export PS2='> '
