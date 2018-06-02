#!/bin/bash
# Author: https://github.com/electronicsleep
# Git: https://github.com/electronicsleep/MediaPi
# Purpose: Movie Looper for the Rasberry Pi
# Released under the BSD license

# write movie playlist file and start video

echo "default" > /tmp/play-mp4.txt
#echo "featured" > /tmp/play-mp4.txt
#echo "gopro-sdcard" > /tmp/play-mp4.txt
#echo "raw-footage" > /tmp/play-mp4.txt
#echo "relax" > /tmp/play-mp4.txt

bash -x /media/usb/play-mp4.sh
