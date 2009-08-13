#!/bin/sh
#
# ~/.xinitrc
#
# exports
export XDG_DATA_HOME="/home/clay/.config"
export XDG_CONFIG_HOME="/home/clay/.config"
# set the cursor
xsetroot -cursor_name left_ptr
# gnome-power-manager
if [ -x /usr/bin/gnome-power-manager ] ; then
   sleep 3
   gnome-power-manager
fi
# start XMonad
exec ck-launch-session xmonad
