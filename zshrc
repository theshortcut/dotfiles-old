# Make sure homebrewed stuff comes first in path
export PATH="$HOME/bin:/usr/local/share/npm/bin:/usr/local/bin:/usr/local/sbin:$PATH"
# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh
export TERM=screen-256color

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="agnoster"

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
plugins=(git rbenv brew node npm)

source $ZSH/oh-my-zsh.sh

[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# Customize to your needs...

export ANDROID_HOME=`find /usr/local/Cellar/android-sdk/*  -maxdepth 0 -print 2> /dev/null | tail -n 1`

# jenv support
export PATH="$HOME/.jenv/bin:$PATH"
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

# Aliases
alias git-sub-pull='git submodule foreach git pull origin master'
alias gitjk="history 10 | tail -r | gitjk_cmd"
alias logmon="sudo tail -F \`sudo find /var/log/ -iname '*.log'\` /usr/local/var/log/redis.log /usr/local/var/log/mongodb/output.log"

