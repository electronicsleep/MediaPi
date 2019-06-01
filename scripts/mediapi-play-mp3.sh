#!/bin/bash
# Author: https://github.com/electronicsleep
# Git: https://github.com/electronicsleep/MediaPi
# Purpose: MediaPi - Media player web interface for the Rasberry Pi
# Released under the BSD license

DIR=/var/www/html
IFS=$'\n'

if [ -a "$DIR/mediapi-play-mp3.txt" ]; then

  PLAYLIST=$(cat $DIR/mediapi-play-mp3.txt)
  echo "Started play mp3..." >> /home/pi/scripts/mediapi-play-mp3.log
  sudo rm $DIR/mediapi-play-mp3.txt

  if [ -a "$DIR/mediapi-playing-now.txt" ]; then
    echo "playing already, exit"
    exit
  fi

  #ALL FILES IN MP3 DIR
  FILES=$(find $DIR/songs/ -iname "*.mp3" -print)

  for FILE in $FILES
  do
    echo "Playing $FILE..."
    echo "Playing $FILE..." >> /home/pi/scripts/mediapi-play-mp3.log
    echo "$FILE" > $DIR/mediapi-playing-now.txt
    omxplayer -o hdmi "$FILE"
  done
  echo "Finished playlist..."

  sudo rm $DIR/mediapi-play-mp3.txt
  sudo rm $DIR/mediapi-playing-now.txt

else
  echo "Already playing..."
fi
