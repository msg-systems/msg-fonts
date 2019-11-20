#!/bin/sh
##
##  msg-Fonts-3-DTP-macOS-System-Uninstall.sh
##

dst="/Library/Fonts"
echo "++ Uninstalling fonts from system"
for font in msg-Fonts-3-DTP/*.ttf; do
    ttf=`echo $font | sed -e 's;^.*/;;'`
    echo "-- Uninstalling font \"$ttf\""
    if [ -f "$dst/$ttf" ]; then
        echo "   File-Target: $dst/$ttf [DELETE]"
        sudo rm -f "$dst/$ttf"
    fi
done

