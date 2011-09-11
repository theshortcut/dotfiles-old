# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="theunraveler"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ruby rails3 bundler gem brew node npm)


source $ZSH/oh-my-zsh.sh

[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# Customize to your needs...

# Aliases
alias syncmusic='rsync -Cavvz --progress --delete ~/Music/iTunes/iTunes\ Music/ clay@192.168.1.99:Music/'
alias archssh='ssh clay@192.168.1.99'
alias archtorrent='sshfs clay@192.168.1.99:/mnt/torrents /Users/clay/Library/Application\ Support/MacFUSE/mounts/archtorrent -oauto_cache,reconnect,volname=ArchTorrents'
alias cfdotcom='ssh cferris@claytonferris.com'
alias archmount='sshfs clay@192.168.1.99:/home/clay /Users/clay/Library/Application\ Support/MacFUSE/mounts/arch -oauto_cache,reconnect,volname=Arch'
alias microuno='ssh -i ~/.ssh/MicroUno.pem ec2-user@50.17.253.188'
alias git-sub-pull='git submodule foreach git pull origin master'
alias logmon="sudo tail -F \`sudo find /var/log/ -iname '*.log'\` /var/log/{dmesg,messages}.log /var/log/mongod | ccze"
alias pg_start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias pg_stop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"
