#!/bin/bash
# Author: https://github.com/electronicsleep
# Git: https://github.com/electronicsleep/MediaPi
# Purpose: MediaPi - Web controlled media player for the Rasberry Pi
# Released under the BSD license

echo "Deploying web interface and media..."
HOST=pi@mediapi.local
rsync -avz -e ssh www/* $HOST:/var/www/html/

echo "Deploying scripts..."
rsync -avz -e ssh scripts/* $HOST:/home/pi/scripts/

echo "Done"
