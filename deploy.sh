#!/bin/bash
# Author: https://github.com/electronicsleep
# Git: https://github.com/electronicsleep/MediaPi
# Purpose: MediaPi - Web controlled media player for the Rasberry Pi
# Released under the BSD license

# Set hosts file, update permissions then deploy web interface
# ssh pi@mediapi.local
# sudo chown -R pi /var/www
# sudo chmod -R 775 /var/www
# sudo chgrp -R www-data /var/www/

echo "Deploying web interface and media..."
HOST=pi@mediapi.local
rsync -avz -e ssh www/* $HOST:/var/www/

echo "Deploying scripts..."
rsync -avz -e ssh scripts/* $HOST:/home/pi/scripts/

echo "Done"
