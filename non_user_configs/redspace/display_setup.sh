#!/bin/sh
xrandr --setprovideroutputsource modesetting NVIDIA-0

# set up the two monitors
xrandr --output HDMI-0 --primary --mode 2560x1080 --pos 0x0 --rotate normal
xrandr --output DP-3 --mode 1920x1080 --pos 2560x340 --rotate normal

# i'm located in /etc/lightdm/display_setup.sh
