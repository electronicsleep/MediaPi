#!/bin/bash

# Author: https://github.com/electronicsleep
# Git: https://github.com/electronicsleep/MediaPi
# Date: 03/15/2016
# Purpose: Movie Looper for the Rasberry Pi
# Released under the BSD license

#Set hosts file, update permissions then deploy web interface
#ssh pi@mediapi.local
#chown -R pi /var/www
#chmod -R 775 /var/www
#chgrp -R www-data /var/www/

HOST=pi@mediapi.local
scp www/* $HOST:/var/www/
