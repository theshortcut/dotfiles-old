#PATH
export PATH="/Users/clay/.cabal/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/sbin:$PATH"

#JRUBY STUFF
export JRUBY_HOME="/Users/clay/src/jruby~main"
export JRUBY_RACK_HOME="/Users/clay/src/jruby-rack"
export GAEJ_HOME="/Users/clay/src/appengine-java-sdk"

#XDG STUFF
export XDG_DATA_HOME="/Users/clay/.config"

#USERWM
export USERWM=~/.cabal/bin/xmonad

#Colored ls
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

export EDITOR=vim

#aliases
alias la="ls -a"
alias l="ls -la"
alias ..="cd .."
alias ps="ps -cU `whoami`"
alias ferris-server="ssh clay@clei.ath.cx"
alias cf.com="ssh cferris@claytonferris.com"
alias pwn3r="ssh pwn3r@pwn3r.org"
alias syncmusic='rsync -Cavvz --progress --delete ~/Music/iTunes\ Music/ clay@192.168.1.99:Music/'
alias restartmysql='sudo launchctl unload -w /Library/LaunchDaemons/org.macports.mysql5-devel.plist;sudo launchctl load -w /Library/LaunchDaemons/org.macports.mysql5-devel.plist'

#prompt
GREEN="\[\033[1;32m\]"
RESET="\[\033[0m\]"
export PS1="$GREEN\W$RESET\$ "
export PS2='> '
