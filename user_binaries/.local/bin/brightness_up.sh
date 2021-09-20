#!/bin/bash
brigh_level=$(cat /home/fejori/.local/sys/brightness)
brigh_sys=$(cat /sys/class/backlight/intel_backlight/brightness)
lock_bool=$(cat /home/fejori/.local/sys/lock_brightness)

brigh_level_dir='/home/fejori/.local/sys/brightness'
brigh_sys_dir='/sys/class/backlight/intel_backlight/brightness'

inc=5000
sum=$((brigh_sys + inc)) 
max=114295

if [[ $lock_bool = 0 ]];then
	if [ $sum -lt $max ];then
		echo $sum
		echo $sum  > $brigh_level_dir
		echo $sum > $brigh_sys_dir
	else
		echo 'Max reached'
	fi
else
	echo ue
fi
