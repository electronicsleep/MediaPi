MEDIA PI
========

Movie Looper for the Rasberry Pi

Can play movies continuously on boot or respond to commands

Store movies and scrips on a old thumb drive and play at boot

Turn your old TV into a rain machine or play your favorite videos

#Requirements:

RasberryPi2

Raspbian OS

Thumbrive

HDMI cable

Old TV

Projector - optional

#Files:

autoplay-mp4.sh

play-mp4.sh

#Features:

Movie Playlists

#Flashcard Contents:

```
DIR: /media/FLASHDEVICE
-> autplay-mp4.sh
-> play-mp4.sh
-> video -> featured -> your movies
            raw-footage -> your movies
            relax -> your movies
```

#Examples:

Show footage on TV with friends while editing

Peaceful Rain Example Idea

https://www.youtube.com/watch?v=WlPUJHeWvpg

Great for parties or events

GoPro Videos

Portable

#Install:

1. Ensure omxplayer is installed.

2. Put your movies and files on a USB flash device using structure above.

3. Install cronjob to autoplay movies at reboot change location if needed, comment out.

crontab -e

```
#MEDIAPI AUTOPLAY
#*/15 * * * *  bash -x /media/FLASHDEVICE/autoplay-mp4.sh > /media/FLASHDEVICE/autoplay-mp4.out 
#@reboot  bash -x /media/FLASHDEVICE/autoplay-mp4.sh > /media/FLASHDEVICE/autoplay-mp4.out 
```

#Resources:

https://www.raspberrypi.org/products/raspberry-pi-2-model-b/

https://www.raspberrypi.org/downloads/raspbian/
