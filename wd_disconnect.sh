#!/bin/bash
 
cd /sys/bus/usb/devices
bon_usb=$(grep -H Western usb?/?-?/manufacturer | cut -d"/" -f1,2)
cd ${bon_usb}/power
gksudo "sh -c 'echo "suspend" > level'"
echo message:Le disque dur WD Passport peut maintenant être débranché en toute sécurité. | zenity --notification --listen --window-icon="info" | zenity --notification --window-icon="info" --text="Le disque dur WD Passport peut maintenant être débranché en toute sécurité."
