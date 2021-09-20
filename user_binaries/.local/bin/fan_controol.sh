#!/bin/bash
fan_speed_now=$(cat /home/fejori/.local/sys/fan_speed)
case "$fan_speed_now" in
    0)
	ec-probe write 0x5e 0x80
	echo one
	echo 1 > /home/fejori/.local/sys/fan_speed
        ;;
    1)
	ec-probe write 0x5e 0x40
	echo two
	echo 2 > /home/fejori/.local/sys/fan_speed
        ;;
    2)
	ec-probe write 0x5e 0xC0
	echo zero
	echo 0 > /home/fejori/.local/sys/fan_speed
        ;;
esac
