. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completion
. ~/.zsh/rtn_specific
 
# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && . ~/.localrc

# rvm
if [ -s ~/.rvm/scripts/rvm ] ; then source ~/.rvm/scripts/rvm ; fi
