#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

userresources=$HOME/.Xresources
sysresources=/etc/X11/xinit/.Xresources

DEFAULT_SESSION=i3

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

get_session(){
	local dbus_args=(--sh-syntax --exit-with-session)
	case $1 in
		bspwm) dbus_args+=(bspwm-session) ;;
		i3|i3wm) dbus_args+=(i3 --shmlog-size 0) ;;
		*) dbus_args+=($DEFAULT_SESSION) ;;
	esac

	echo "dbus-launch ${dbus_args[*]}"
}

# Modifications
xrdb -merge ~/.Xresources
setxkbmap -option ctrl:nocaps

xrandr --auto
xrandr --dpi 220
exec $(get_session)

# Configure keyboard layout
## Switchinf between English (us) and German (de) with AltGr key.
setxkbmap -layout de,us -variant ,bas_phonetic -option grp:switch 