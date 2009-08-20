#!/bin/sh
#
# ~/.xinitrc
#
# exports
export XDG_DATA_HOME="/home/clay/.config"
export XDG_CONFIG_HOME="/home/clay/.config"

# xmodmap
xmodmap ~/.Xmodmap

# sessions
case $1 in
  xmonad)
  exec ck-launch-session xmonad
  ;;
  *)
  exec startkde
  ;;
esac
