#!/bin/bash
# This file configures polybar

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# set up monitors for polybar, platform agnostic
my_laptop_external_monitor=$(xrandr --query | grep 'HDMI-1-0')
this_machine=$HOSTNAME

if [[ $this_machine = *redspace* ]]; then
	polybar mybar &
	polybar external &
else
	if [[ $my_laptop_external_monitor = *disconnected* ]]; then
		polybar mybar &
	else
		if [[ $my_laptop_external_monitor = *connected* ]]; then
			polybar mybar &
			polybar external &
		else
			polybar mybar &
		fi
	fi
fi

echo "Polybar launched..."
