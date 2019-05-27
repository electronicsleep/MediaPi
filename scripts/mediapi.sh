#!/bin/bash
# Author: https://github.com/electronicsleep
# Git: https://github.com/electronicsleep/MediaPi
# Purpose: MediaPi - Media player web interface for the Rasberry Pi
# Released under the BSD license

echo "Starting MediaPi Script..."

# Autoplay mp4
#echo "folder" > /tmp/mediapi-play-mp4.txt

# Autoplay mp3
echo "folder" > /tmp/mediapi-play-mp3.txt

while true; do
  DIR=/home/pi/scripts
  if [ -a /tmp/mediapi-stop.txt ]; then
    echo "stop media" >> $DIR/mediapi.log
    bash -x $DIR/mediapi-stop.sh &
    sudo rm /tmp/mediapi-stop.txt

  elif [ -a /tmp/mediapi-play-mp4.txt ]; then
    echo "start movie" >> $DIR/mediapi.log
    bash -x $DIR/mediapi-play-mp4.sh &

  elif [ -a /tmp/mediapi-play-mp3.txt ]; then
    echo "start song" >> $DIR/mediapi.log
    bash -x $DIR/mediapi-play-mp3.sh &

  else
    echo "nothing to do, waiting for command..."
  fi
 sleep 15
done
