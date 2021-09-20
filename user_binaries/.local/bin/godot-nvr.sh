#!/bin/bash
string=$( printf '%s ' $(/home/fejori/.local/bin/nvr --serverlist))
if [[ "$string" == *"godot"* ]];then
	# echo $string
	# dunstify --action="replyAction,reply" "hello $string"&
	$@
else
	# echo $string
	# dunstify --action="replyAction,reply" "hello $string"&
	/usr/bin/kitty $@
fi
