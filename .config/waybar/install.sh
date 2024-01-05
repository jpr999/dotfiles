#!/bin/bash

killall waybar 

if [[$user = "paul" ]]
then
    waybar -c ~/.config/waybar/config & -s ~/.config/waybar/style.css
else
    waybar & 
fi    
