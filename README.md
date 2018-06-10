MEDIA PI
========

Author: https://github.com/electronicsleep

Movie Looper for the Rasberry Pi using USB drive for storage

# Setup USB media

```
sudo mkdir /media/usb
#One time USB device mount
sudo mount -t vfat /dev/sda /media/usb
#Keep USB device
sudo vim /etc/fstab
#Add to fstab
/dev/sda /media/usb vfat rw,user,defaults 0 2
sudo mount /media/usb
```

# Install:

Ensure omxplayer is installed.

```
sudo apt-get install omxplayer -y
```

# Install files on USB media:

autoplay-mp4.sh -> file used to write playlist file and start video loop

play-mp4.sh -> use for startup via cronjob

stop-mp4.sh -> stop all videos via kill

control.sh -> stop/start movie

www -> web interface


Can play movies continuously on boot or respond to commands

Store movies and scrips on a old thumb drive and play at boot

Turn your old TV into a movie player or play your favorite videos or songs

Web interface has visual representation of video size, commenting on videos and start stop control

Can also play mp3 files and  make digital video frame

Future ideas include collaborative movie editing and viewing

![Alt text](screenshot.jpg?raw=true "ScreenShot")

![Alt text](screenshot-web.jpg?raw=true "ScreenShot Web Interface")

# Requirements:

Working RasberryPi2, Raspbian 8

Thumbrive, HDMI cable, Old TV

Projector - optional

Wifi USB device - optional for web interface


# Example Flashcard Contents:

```
DIR: /media/usb
-> autplay-mp4.sh
-> play-mp3.sh
-> play-mp4.sh
-> stop-mp4.sh
-> control.sh
-> video -> featured -> main video playlist [Add first videos here!]
            raw-footage -> your recently recorded movies
            relax -> your relaxing meditate movies
```

# Run (via ssh on pi)

```
sudo apt-get install screen -y

screen
bash /media/usb/autoplay-mp4.sh

# Stop
bash /media/usb/stop-mp4.sh
```

# Features:

Movie Playlists: Order and continuously play movies

Web Interface: See what video is playing and comment/rate video

# Uses:

Show footage on TV with friends while editing

Review recorded GoPro Videos

Portable Movie player

Recycle (what is old is new again)

Put your movies and files on a USB flash device using structure above.

Install cronjob to autoplay movies at reboot change location if needed, comment out.

# Start at boot (optional)

as pi user
crontab -e

```
#MEDIAPI AUTOPLAY AT BOOT
# @reboot    bash -x /media/usb/autoplay-mp4.sh > /media/usb/autoplay-mp4.out 
#MEDIAPI CONTROL
# * * * * *  bash -x /media/usb/control.sh > /media/usb/control.out
```

# Install Web Interface:

1. Install apache, php, setup wifi, permissions on web folder

```
sudo apt-get install apache2 php5 -y
```

2. Deploy files to MediaPi (deploy.sh)

```
bash deploy.sh
```

#remove old html dir

```
rm /var/www/html/index.html
```

3. Control via web interface, start, stop, comment

# FAQ

Q) How do I boot up normally and not play videos?

A) Remove the usb stick

Q) How to stop the videos while playing?

A) ssh to the mediapi: echo "stop" > /tmp/play-mp4.txt or use web interface

Q) Does this require X running?

A) No does not require X (although it will work either way)


# Resources:

https://www.raspberrypi.org/products/raspberry-pi-2-model-b/

https://www.raspberrypi.org/downloads/raspbian/
