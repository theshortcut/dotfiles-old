. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completion
 
# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && . ~/.localrc

# rvm-install added line:
if [[ -s /home/clay/.rvm/scripts/rvm ]] ; then source /home/clay/.rvm/scripts/rvm ; fi

