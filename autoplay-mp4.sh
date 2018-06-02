#!/bin/bash

# Author: https://github.com/electronicsleep
# Purpose: Movie Looper for the Rasberry Pi
# Released under the BSD license

#MEDIAPI AUTOPLAY | crontab -e
#*/15 * * * *  bash -x /media/usb/autoplay-mp4.sh > /media/usb/autoplay-mp4.out 
#@reboot  bash -x /media/usb/autoplay-mp4.sh > /media/usb/autoplay-mp4.out 

# send playlist file used for starting movie loop play and run play-mp4 script

echo "default" > /tmp/play-mp4.txt
#echo "featured" > /tmp/play-mp4.txt
#echo "gopro-sdcard" > /tmp/play-mp4.txt
#echo "raw-footage" > /tmp/play-mp4.txt
#echo "relax" > /tmp/play-mp4.txt

bash -x /media/usb/play-mp4.sh
