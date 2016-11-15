#!/bin/bash

# Author: Chris Robertson <electronicsleep@gmail.com>
# Date: 03/15/2016
# Purpose: Movie Looper for the Rasberry Pi
# Released under the BSD license

#MEDIAPI AUTOPLAY | crontab -e
#*/15 * * * *  bash -x /media/FLASHDEVICE/autoplay-mp4.sh > /media/FLASHDEVICE/autoplay-mp4.out 
#@reboot  bash -x /media/FLASHDEVICE/autoplay-mp4.sh > /media/FLASHDEVICE/autoplay-mp4.out 

# send playlist file used for starting movie loop play and run play-mp4 script

echo "featured" > /tmp/play-mp4.txt
#echo "gopro-sdcard" > /tmp/play-mp4.txt
#echo "raw-footage" > /tmp/play-mp4.txt
#echo "relax" > /tmp/play-mp4.txt

bash -x /media/FLASHDEVICE/play-mp4.sh
