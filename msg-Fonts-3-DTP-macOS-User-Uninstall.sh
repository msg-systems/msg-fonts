#!/bin/sh
##
##  msg-Fonts-3-DTP-macOS-User-Uninstall.sh
##

dst="$HOME/Library/Fonts"
echo "++ Uninstalling fonts from user"
for font in msg-Fonts-3-DTP/*.ttf; do
    ttf=`echo $font | sed -e 's;^.*/;;'`
    echo "-- Uninstalling font \"$ttf\""
    if [ -f "$dst/$ttf" ]; then
        echo "   File-Target: $dst/$ttf [DELETE]"
        rm -f "$dst/$ttf"
    fi
done

