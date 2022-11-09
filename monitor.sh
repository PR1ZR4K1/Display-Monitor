#!/bin/bash

#getting interface name like HDMI-1

primary=$(xrandr | grep -w connected | grep primary | awk '{print $1;}')
secondary=$(xrandr | grep -w connected | grep HDMI | awk '{print $1;}')

# 1 is the first parameter inputted when script is called
if [ $1 == "left" ]
then
	#new screen to the left of primary
	xrandr --output $secondary --auto --left-of $primary
	
elif [ $1 == "right" ]
then
	#new screen to the right of primary
	xrandr --output $secondary --auto --right-of $primary
elif [ $1 == "off" ]
then
	#turns secondary screen off
	xrandr --output $secondary --off
else
	#duplicate display
	xrandr --output $secondary --auto --same-as $primary
fi
