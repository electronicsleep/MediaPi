MEDIA PI
========

Author: https://github.com/electronicsleep

Web controlled media player for the Rasberry Pi

# Install:

Ensure omxplayer is installed.

```
sudo apt-get install omxplayer -y
```

# Install files on USB media:

autoplay-mp4.sh -> file used to write playlist file and start video loop

play-mp4.sh -> use for startup via cronjob

stop-mp4.sh -> stop all videos via kill

control.sh -> stop/start media

www -> web interface

Can play movies continuously on boot or respond to commands via web interface

Turn your old TV into a movie player or play your favorite videos or songs

![Alt text](screenshot.jpg?raw=true "ScreenShot")

![Alt text](screenshot-web.jpg?raw=true "ScreenShot Web Interface")

# Requirements:

Working RasberryPi2, Raspbian 8

HDMI cable, TV with HDMI

Wifi USB device (using LB-Link) - for access to ssh/web interface

LB-Link USB Wi-Fi Dongle with Antenna for Raspberry Pi PC


# Scripts:

```
DIR: /home/pi/scripts
-> autplay-mp4.sh
-> play-mp3.sh
-> play-mp4.sh
-> stop-mp4.sh
-> control.sh
```

# Run: (via ssh on pi)

```
sudo apt-get install screen -y

screen
bash /home/pi/scripts/autoplay-mp4.sh

# Stop
bash /home/pi/scripts/media/usb/stop-mp4.sh
```

# Features:

Movie Playlists: Continuously play movies

Web Interface: See what video is playing and start and stop media

# Uses:

Show footage on TV with friends

Review recorded GoPro Videos

Small Portable Movie player

Recycle (repurpose an old not smart TV)

Install scripts to autoplay movies at boot 

# Start at boot (optional)

as pi user
crontab -e

```
#MediaPi: Autoplay at boot
# @reboot    bash -x /home/pi/autoplay-mp4.sh > /home/pi/autoplay-mp4.out 
#MediaPi: Control script for web interface control
@reboot    bash -x /home/pi/scripts/mediapi.sh >> /home/pi/scripts/mediapi.log 2>&1
# * * * * *  bash -x /home/pi/scripts/control.sh >> /home/pi/scripts/control.log 2>&1
```

# Install Web Interface:

1. Install apache, php, setup wifi, permissions on web folder

```
sudo apt-get install apache2 php5 -y
```

2. Deploy files to MediaPi

```
bash deploy.sh
```

3. Remove old html file

```
rm /var/www/html/index.html
```

4. Control via web interface, start, stop, comment

```
Go to your rasberrypi Ip address (ifconfig) 
```

# FAQ:

Q) How do I boot up normally and not play videos?

A) Comment out the autoplay cronjob if enabled

Q) How to stop the videos while playing?

A) ssh to the mediapi: echo "stop" > /tmp/play-mp4.txt or use web interface

Q) Does this require X running?

A) No does not require X (although it will work either way)

# Resources:

https://www.raspberrypi.org/products/raspberry-pi-2-model-b/

https://www.raspberrypi.org/downloads/raspbian/

https://elinux.org/RPi_USB_Wi-Fi_Adapters
