#!/bin/bash
# Author: https://github.com/electronicsleep
# Git: https://github.com/electronicsleep/MediaPi
# Purpose: MediaPi - Media player web interface for the Rasberry Pi
# Released under the BSD license

echo "Starting MediaPi Script..."

rm /var/www/html/mediapi-playing-now.txt

WDIR=/var/www/html
DIR=/home/pi/scripts

# Autoplay mp4
#echo "folder" > $DIR/mediapi-play-mp4.txt

# Autoplay mp3
echo "folder" > $DIR/mediapi-play-mp3.txt

while true; do
  if [ -a "$WDIR/mediapi-stop.txt" ]; then
    echo "stop media" >> $DIR/mediapi.log
    bash $DIR/mediapi-stop.sh &

  elif [ -a "$WDIR/mediapi-play-mp4.txt" ]; then
    echo "start movie" >> $DIR/mediapi.log
    bash $DIR/mediapi-play-mp4.sh &

  elif [ -a "$WDIR/mediapi-play-mp3.txt" ]; then
    echo "start song" >> $DIR/mediapi.log
    bash $DIR/mediapi-play-mp3.sh &

  else
    echo "nothing to do, waiting for command..."
  fi
 sleep 15
done
