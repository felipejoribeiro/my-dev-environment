#!/bin/bash
# This file configures polybar

# Check what computer is this
THIS_MACHINE=$HOSTNAME

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# set up monitors for polybar, platform agnostic
echo "configuring polybar for multiple monitors..."

if [[ $THIS_MACHINE == *"redbox"* ]]; then
	for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
		# if [[ $m = *HDMI-1-0* ]]; then
		# 	MONITOR=$m prime-run polybar --reload mybar_note &
		# 	echo $m polybar --reload mybar_desk &
		if [[ $m = *eDP1* ]]; then
			MONITOR=$m polybar --reload mybar_note &
			echo $m polybar --reload mybar_note &
		else
			MONITOR=$m prime-run polybar --reload external &
			echo $m polybar --reload external &
		fi
	done
fi

echo $THIS_MACHINE
if [[ $THIS_MACHINE == *"redspace"* ]]; then
	for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
		if [[ $m = *DP-3* ]]; then
			MONITOR=$m polybar --reload mybar_desk &
			echo $m polybar --reload mybar_desk &
		else
			MONITOR=$m polybar --reload external &
			echo $m polybar --reload external &
		fi
	done
fi

echo "Polybar launched..."
