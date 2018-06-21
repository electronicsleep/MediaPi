#!/bin/bash
# Author: https://github.com/electronicsleep
# Git: https://github.com/electronicsleep/MediaPi
# Purpose: Movie Looper for the Rasberry Pi
# Released under the BSD license

# Set hosts file, update permissions then deploy web interface
# ssh pi@mediapi.local
# sudo chown -R pi /var/www
# sudo chmod -R 775 /var/www
# sudo chgrp -R www-data /var/www/

#echo "Deploy Scripts to USB device"
#USB='/Volumes/USBDRIVE'
#cp *.sh $USB
#cp -rf video $USB

echo "Deploy Web Interface"
HOST=pi@mediapi.local
scp www/* $HOST:/var/www/
scp *sh $HOST:/media/usb/

echo "Done"
