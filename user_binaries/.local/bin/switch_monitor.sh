#!/bin/bash

# set up the two monitors for bspwm platform independent
my_laptop_external_monitor=$(xrandr --query | grep 'HDMI-1-0')
this_machine=$HOSTNAME

if [[ $this_machine = *redspace* ]]; then
	bspc monitor "HDMI-0" -d 1 2 3
	bspc monitor "DP-3" -d 4 5
	bspc monitor "DP-1" -d 6 7
	bspc wm -O HDMI-0 DP-3 DP-1
fi

if [[ $this_machine = *redbox* ]]; then
	if [[ $my_laptop_external_monitor = *disconnected* ]]; then
		bspc monitor eDP1 -d 1 2 3 4 5 6
	else
		if [[ $my_laptop_external_monitor = *connected* ]]; then
			bspc monitor HDMI-1-0 -d 1 2 3
			bspc monitor eDP1 -d 4 5 6
			bspc wm -O HDMI-1-0 eDP1
		else
			bspc monitor eDP1 -d 1 2 3 4 5 6
		fi
	fi
fi

# relaunch polybar
$HOME/.config/polybar/launch.sh &

# reload nitrogen
nitrogen --restore &
