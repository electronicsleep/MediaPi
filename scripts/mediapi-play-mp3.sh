#!/bin/bash
# Author: https://github.com/electronicsleep
# Git: https://github.com/electronicsleep/MediaPi
# Purpose: Movie Looper for the Rasberry Pi
# Released under the BSD license

DIR=/var/www
IFS=$'\n'

if [ -a /tmp/mediapi-play-mp3.txt ]; then

  PLAYLIST=$(cat /tmp/mediapi-play-mp3.txt)
  echo "Started play mp3..." >> /home/pi/scripts/mediapi-play-mp3.log
  sudo rm /tmp/mediapi-play-mp3.txt

  if [ -a /tmp/mediapi-playing-now.txt ]; then
    echo "playing already, exit"
    exit
  fi

  #ALL FILES IN MP3 DIR
  FILES=$(find $DIR/songs/ -iname "*.mp3" -print)

  for f in $FILES
  do
    echo "Playing $f file..."
    echo "Playing $f file..." >> /home/pi/scripts/mediapi-play-mp3.log
    echo "$f" >> /tmp/mediapi-playing-now.txt
    omxplayer -o hdmi "$f"
  done
  echo "Finished playlist..."

  sudo rm /tmp/mediapi-play-mp3.txt
  sudo rm /tmp/mediapi-playing-now.txt

else
  echo "Already playing..."
fi
