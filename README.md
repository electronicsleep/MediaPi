MEDIA PI
========

Movie Looper for the Rasberry Pi

Can play movies continuously on boot or respond to commands

Requirements:

RasberryPi2
Raspbian OS
Thumbrive
HDMI cable

Old TV
Projector - optional


Install:

1. update your cronjob to include start script or run with cron

crontab -e

#add
* * * * *  bash -x /media/FLASHDEVICE/autoplay-mp4.sh > /media/FLASHDEVICE/autoplay-mp4.out 

Files:

autoplay-mp4.sh
play-mp4

Features:

Movie Playlists

Flashcard Contents:

-> autplay-mp4.sh
-> play-mp4.sh
-> video -> featured -> your movies
            raw-footage -> your movies
            relax -> your movies

Examples:

Peaceful Rain
https://www.youtube.com/watch?v=WlPUJHeWvpg
Grat for parties or events
GoPro Videos
Portable


Install:

1. Ensure omxplayer is installed

2. Put your movies and files on a USB flash device using structure above

3. Install cronjob to autoplay movies at reboot change location if needed
crontab -e
#MEDIAPI AUTOPLAY
#* * * * *  bash -x /media/FLASHDEVICE/autoplay-mp4.sh > /media/FLASHDEVICE/autoplay-mp4.out 

Resources:
https://www.raspberrypi.org/products/raspberry-pi-2-model-b/
https://www.raspberrypi.org/downloads/raspbian/
