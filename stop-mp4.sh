#!/bin/bash

# Author: Chris Robertson <electronicsleep@gmail.com>
# Git: https://github.com/electronicsleep/MediaPi
# Date: 03/15/2016
# Purpose: Movie Looper for the Rasberry Pi
# Released under the BSD license

# Stop the MP4 ployer

if [ -a /tmp/play-mp4.txt ]; then

 PLAYLIST=$(cat /tmp/play-mp4.txt)

 if [ $PLAYLIST == 'stop' ]; then

  echo $(ps aux | grep play-mp4)
  kill $(ps aux | grep play-mp4 | awk '{print $2}')
  echo $(ps aux | grep 'omxplayer')
  kill $(ps aux | grep 'omxplayer' | awk '{print $2}')

  rm /tmp/play-mp4.txt
  rm /tmp/playing-mp4.txt
  rm /tmp/playing-now.txt

 fi

fi