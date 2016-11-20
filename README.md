MEDIA PI
========

Movie Looper for the Rasberry Pi

Can play movies continuously on boot or respond to commands

Store movies and scrips on a old thumb drive and play at boot

Turn your old TV into a rain machine or play your favorite videos

Web interface has visual representation of video size, commenting on videos and start stop control

Can also play mp3 files

Cheap digital video frame

![Alt text](screenshot.jpg?raw=true "ScreenShot")

![Alt text](screenshot-web.jpg?raw=true "ScreenShot Web Interface")

#Requirements:

RasberryPi2

Raspbian OS

Thumbrive

HDMI cable

Old TV

Projector - optional

Wifi USB device - optional for web interface

Recycle (what is old is new again)

#Files:

autoplay-mp4.sh

play-mp4.sh

stop-mp4.sh

www -> web interface

#Features:

Movie Playlists

Web Interface

#Flashcard Contents:

```
DIR: /media/FLASHDEVICE
-> autplay-mp4.sh
-> play-mp4.sh
-> stop-mp4.sh
-> video -> featured -> video.mp4
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
#MEDIAPI AUTOPLAY | crontab -e
#@reboot    bash -x /media/FLASHDEVICE/autoplay-mp4.sh > /media/FLASHDEVICE/autoplay-mp4.out 
#* * * * *  bash -x /media/FLASHDEVICE/autoplay-mp4.sh > /media/FLASHDEVICE/autoplay-mp4.out 
#* * * * *  bash -x /media/FLASHDEVICE/stop-mp4.sh > /media/FLASHDEVICE/autoplay-mp4.out 
```

#Install Web Interface:

1. Install apache, php, setup wifi, permissions on web folder

2. Deploy files to MediaPi (deploy.sh)

3. Control via web interface, start, stop, comment

#FAQ

Q) How do I boot up normally and not play videos

A) Remove the usb stick

Q) How to stop the videos while playing

A) ssh to the mediapi: echo "stop" > /tmp/play-mp4.txt or use web interface

#Resources:

https://www.raspberrypi.org/products/raspberry-pi-2-model-b/

https://www.raspberrypi.org/downloads/raspbian/
