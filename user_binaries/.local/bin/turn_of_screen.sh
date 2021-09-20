#!/bin/bash
lock_bool_dir='/home/fejori/.local/sys/lock_brightness'
brigh_sys_dir='/sys/class/backlight/intel_backlight/brightness'

lock_bool=$(cat /home/fejori/.local/sys/lock_brightness)
brigh_level=$(cat /home/fejori/.local/sys/brightness)

if [ $lock_bool = 0 ];then
	echo 1 > $lock_bool_dir
	echo 0 > $brigh_sys_dir
else
	echo 0 > $lock_bool_dir
	echo $brigh_level > $brigh_sys_dir
fi


