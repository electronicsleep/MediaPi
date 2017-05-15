MEDIA PI
========

Author: https://github.com/electronicsleep

Movie Looper for the Rasberry Pi

Can play movies continuously on boot or respond to commands

Store movies and scrips on a old thumb drive and play at boot

Turn your old TV into a movie player or play your favorite videos

Web interface has visual representation of video size, commenting on videos and start stop control

Can also play mp3 files to make a Cheap digital video frame

Future ideas include collaborative movie editing and viewing

![Alt text](screenshot.jpg?raw=true "ScreenShot")

![Alt text](screenshot-web.jpg?raw=true "ScreenShot Web Interface")

# Requirements:

RasberryPi2, Raspbian OS

Thumbrive, HDMI cable, Old TV

Projector - optional

Wifi USB device - optional for web interface



# Setup USB media

```
sudo mkdir /media/usb
sudo vim /etc/fstab
/dev/sda /media/usb vfat rw,user,defaults 0 2
sudo mount /media/usb
```

# Files:

autoplay-mp4.sh -> file ussed to write playlist file and start video loop

play-mp4.sh -> use for startup via cronjob

stop-mp4.sh -> stop all videos via kill

www -> web interface

# Features:

Movie Playlists: order and continuously play movies

Web Interface: see what video is playing and comment/rate video

# Flashcard Contents:

```
DIR: /media/usb
-> autplay-mp4.sh
-> play-mp3.sh
-> play-mp4.sh
-> stop-mp4.sh
-> video -> featured -> main video playlist
            raw-footage -> your recently recorded movies
            relax -> your relaxing meditate movies
```

# Uses:

Show footage on TV with friends while editing

Review recorded GoPro Videos

Portable Movie player

Recycle (what is old is new again)

# Install:

1. Ensure omxplayer is installed.

```
sudo apt-get install omxplayer
```

2. Put your movies and files on a USB flash device using structure above.

3. Install cronjob to autoplay movies at reboot change location if needed, comment out.

# Start at boot (optional)

crontab -e

```
#MEDIAPI AUTOPLAY | crontab -e
#@reboot    bash -x /media/usb/autoplay-mp4.sh > /media/usb/autoplay-mp4.out 
#* * * * *  bash -x /media/usb/autoplay-mp4.sh > /media/usb/autoplay-mp4.out 
#* * * * *  bash -x /media/usb/stop-mp4.sh > /media/usb/autoplay-mp4.out 
```

# Install Web Interface:

1. Install apache, php, setup wifi, permissions on web folder

2. Deploy files to MediaPi (deploy.sh)

3. Control via web interface, start, stop, comment

# FAQ

Q) How do I boot up normally and not play videos

A) Remove the usb stick

Q) How to stop the videos while playing

A) ssh to the mediapi: echo "stop" > /tmp/play-mp4.txt or use web interface


# Resources:

https://www.raspberrypi.org/products/raspberry-pi-2-model-b/

https://www.raspberrypi.org/downloads/raspbian/
