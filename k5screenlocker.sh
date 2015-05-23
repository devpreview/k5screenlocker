#!/bin/sh

ktimeout=`cat ~/.config/kscreenlockerrc | grep Timeout | sed "s/Timeout=//i"`
if [ -z "$ktimeout" ]; then
    ktimeout=1
fi
if [ "$ktimeout" -eq 0 ]; then
    exit 0
fi

delay=`echo "$ktimeout * 60 - 10" | bc`
notify=true

while true
do
    activewindow=`xdotool getactivewindow`
    if [ -n "$activewindow" ]; then
        geometry=`xdotool getwindowgeometry $activewindow | grep Geometry | sed "s/  Geometry: //i"`
        dgeometry=`xdotool getdisplaygeometry | sed "s/ /x/i"`

        if [ "$geometry" = "$dgeometry" ]; then
            idle_time=`qdbus org.kde.screensaver /ScreenSaver GetSessionIdleTime`
            if [ "$idle_time" -ge 50 ]; then
                qdbus org.kde.screensaver /ScreenSaver SimulateUserActivity
            fi
            if [ $notify = true ]; then
                notify-send -i 'dialog-information' 'Screen locker' '<b>Screen locker has been disabled.</b>'
                notify=false
            fi
        else
            notify=true
        fi
    fi
    sleep $delay
done
