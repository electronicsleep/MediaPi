MEDIA PI
========

MediaPi - Media player web interface for the Rasberry Pi

Author: https://github.com/electronicsleep

Play movies continuously on boot or respond to commands via web interface

Turn your TV into a personal movie player to play your favorite videos or songs


# Requirements:

RasberryPi2, Raspbian GNU/Linux 9

HDMI cable, TV with HDMI

Wifi USB device - for access to ssh/web interface

![Alt text](screenshot.jpg?raw=true "ScreenShot")

![Alt text](screenshot-web.jpg?raw=true "ScreenShot Web Interface")


# Install:

Ensure omxplayer is installed.

```
sudo apt-get install omxplayer -y
```


# Install mediapi web interface and scripts:

Enable ssh at boot
https://www.raspberrypi-spy.co.uk/2012/05/enable-secure-shell-ssh-on-your-raspberry-pi/

1. Install apache2, php7, setup wifi, add media to folders in www/

```
sudo apt-get install apache2 php -y

```

2. Setup hosts file for mediapi.local and deploy files

```
# create hosts entry (mediapi.local) update permissions then deploy

mkdir /home/pi/scripts

sudo chown -R pi /var/www/html
sudo chmod -R 775 /var/www/html
sudo chgrp -R www-data /var/www/html

bash deploy.sh
```

3. Remove default html file

```
rm /var/www/html/index.html
```

4. Control via web interface, start music/movies, stop media

```
Launch http://mediapi.local in your browser to access web interface
```

# Start MediaPi at boot:
using pi user
crontab -e

```
#MediaPi: script for media control
@reboot    bash -x /home/pi/scripts/mediapi.sh >> /home/pi/scripts/mediapi.log 2>&1
```

# Start script: (via ssh on pi)

```
sudo apt-get install tmux htop -y

# Start
bash /home/pi/scripts/mediapi-start.sh

# Stop
bash /home/pi/scripts/mediapi-stop.sh
```

# Features:

Movie Playlists: Continuously play movies

Web Interface: See what video is playing and start and stop media

# Uses:

Play a relaxing playlist for you family

Show footage on TV with friends

Review recorded GoPro Videos

Small Portable Movie player

Recycle (repurpose an old not smart TV)

Install scripts to autoplay movies at boot 

# FAQ:

Q) How do I stop playing

A) Easiest way is to simply hit the home button on TV remote to get out of HDMI


Q) How do I boot up normally and not play videos/songs?

A) Comment out the mediapi cron


Q) How to stop the videos while playing?

A) Use the web interface link or ssh to the mediapi: echo "stop" > /tmp/mediapi-stop.txt


Q) Does this require X running?

A) No does not require X (although it will work either way)


# Resources:

https://www.raspberrypi.org/

https://www.raspberrypi.org/products/raspberry-pi-2-model-b/

https://www.raspberrypi.org/downloads/raspbian/

https://elinux.org/RPi_USB_Wi-Fi_Adapters
