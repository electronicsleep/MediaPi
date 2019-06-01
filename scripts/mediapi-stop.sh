#!/bin/bash
# Author: https://github.com/electronicsleep
# Git: https://github.com/electronicsleep/MediaPi
# Purpose: MediaPi - Media player web interface for the Rasberry Pi
# Released under the BSD license

# Stop mediapi / omxplayer player

DIR="/var/www/html"

echo $(ps aux | grep mediapi-play-mp3)
kill $(ps aux | grep mediapi-play-mp3 | awk '{print $2}')
echo $(ps aux | grep mediapi-play-mp4)
kill $(ps aux | grep mediapi-play-mp4 | awk '{print $2}')
echo $(ps aux | grep 'omxplayer')
kill $(ps aux | grep 'omxplayer' | awk '{print $2}')

sudo rm $DIR/mediapi-play-mp4.txt
sudo rm $DIR/mediapi-play-mp3.txt
sudo rm $DIR/mediapi-playing-now.txt
sudo rm $DIR/mediapi-stop.txt

exit 0
