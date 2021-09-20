#!/bin/bash
brigh_level=$(cat /home/fejori/.local/sys/brightness)
brigh_sys=$(cat /sys/class/backlight/intel_backlight/brightness)
lock_bool=$(cat /home/fejori/.local/sys/lock_brightness)

brigh_level_dir='/home/fejori/.local/sys/brightness'
brigh_sys_dir='/sys/class/backlight/intel_backlight/brightness'

inc=5000
sub=$((brigh_sys - inc)) 
min=-1

if [[ $lock_bool = 0 ]];then
	if [ $sub -gt $min ];then
		echo $sub > $brigh_level_dir
		echo $sub > $brigh_sys_dir
	else
		echo 'Min reached'
	fi
fi
