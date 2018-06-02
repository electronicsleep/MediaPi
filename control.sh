#!/bin/bash
# Author: https://github.com/electronicsleep
# Git: https://github.com/electronicsleep/MediaPi
# Purpose: Movie Looper for the Rasberry Pi
# Released under the BSD license

if [ -a /tmp/stop-mp4.txt ]; then

 echo "stop movie"
 bash -x /media/usb/stop-mp4.sh
 sudo rm /tmp/stop-mp4.txt

elif [ -a /tmp/play-mp4.txt ]; then

 echo "start movie"
 bash -x /media/usb/play-mp4.sh

else

 echo "no command"

fi
