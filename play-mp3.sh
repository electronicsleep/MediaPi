#!/bin/bash

# Author: https://github.com/electronicsleep
# Git: https://github.com/electronicsleep/MediaPi
# Date: 03/15/2016
# Purpose: Movie Looper for the Rasberry Pi
# Released under the BSD license

if [ -a /tmp/play-mp3.txt ]; then

rm /tmp/play-mp3.txt
touch /tmp/playing-mp3.txt


#ALL FILES IN MP3 DIR
FILES=$(find /media/FLASHDEVICE/mp3/ -iname "*.mp3" -print)

for f in $FILES
do
  echo "Playing $f file..."
  omxplayer -o hdmi $f
done

rm /tmp/play-mp3.txt
rm /tmp/playing-mp3.txt

fi
