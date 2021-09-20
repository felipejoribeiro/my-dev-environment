#!/bin/bash

# set up the two monitors for bspwm
my_laptop_external_monitor=$(xrandr --query | grep 'HDMI-1-0')
if [[ $my_laptop_external_monitor = *disconnected* ]]; then
	$HOME/.screenlayout/screen_one.sh
	bspc monitor eDP1 -d 1 2 3 4 5 6
else
	if [[ $my_laptop_external_monitor = *connected* ]]; then
		$HOME/.screenlayout/with_wacom.sh
		bspc monitor HDMI-1-0 -d 1 2
		bspc monitor eDP1 -d 3 4 5 6
		bspc monitor HDMI-1-0 -s eDP1 
	else
		$HOME/.screenlayout/screen_one.sh
		bspc monitor eDP1 -d 1 2 3 4 5 6
	fi
fi


# relaunch polybar
$HOME/.config/polybar/launch.sh &

# reload nitrogen
nitrogen --restore &
