#!/bin/bash
# This file configures polybar

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# set up monitors for polybar, platform agnostic
echo "configuring polybar for multiple monitors..."
for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
	if [[ $m = *HDMI-0* ]]; then
		MONITOR=$m polybar --reload mybar_desk &
		echo $m polybar --reload mybar_desk &
	elif [[ $m = *eDP1* ]]; then
		MONITOR=$m polybar --reload mybar_note &
		echo $m polybar --reload mybar_note &
	else
		MONITOR=$m polybar --reload external &
		echo $m polybar --reload external &
	fi
done

echo "Polybar launched..."
