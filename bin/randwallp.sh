#!/bin/sh

while true; do

    echo Changing Wallpaper!
    VAR=$(find ~/Media/Wallpapers -type f | shuf -n 1)  

    hyprctl --quiet hyprpaper preload $VAR 
    hyprctl --quiet hyprpaper wallpaper , $VAR 

	sleep 300
    hyprctl --quiet hyprpaper unload $VAR 
done
