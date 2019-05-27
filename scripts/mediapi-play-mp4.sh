#!/bin/bash
# Author: https://github.com/electronicsleep
# Git: https://github.com/electronicsleep/MediaPi
# Purpose: MediaPi - Media player web interface for the Rasberry Pi
# Released under the BSD license

# Play the MP4 files in a directory 1 million times

### MEDIA LOCATIONS ###

#UPDATE CAMERA INFO
#USB_GOPRO=/media/0000-AAAA/DCIM/100GOPRO
#USB INFO
#USB_NAME=/media/usb
USB_NAME=/var/www/html


if [ -a /tmp/mediapi-play-mp4.txt ]; then

 PLAYLIST=$(cat /tmp/mediapi-play-mp4.txt)

 if [ -a /tmp/mediapi-playing-now.txt ]; then
  echo "playing already, exit"
  exit
 fi

 sudo rm /tmp/mediapi-play-mp4.txt

 FILES=/media/usb/video/*

 ### PLAYLISTS USING INFO FROM TMP FILE

 #if [ $PLAYLIST == 'raw-footage' ]; then
 # FILES=$USB_NAME/video/raw-footage/*.mp4
 #elif [ $PLAYLIST == 'relax' ]; then
 # FILES=$USB_NAME/video/relax/*.mp4
 #elif [ $PLAYLIST == 'gopro-sdcard' ]; then
 # FILES=$USB_GOPRO/*.mp4
 #else
 echo "FILES"
 FILES=$USB_NAME/video/*.mp4
 #fi

 echo $PLAYLIST
 echo $FILES


 ### Repeast all movies

 COUNTER=1000000
 until [ $COUNTER -lt 1 ]; do

  for F in $FILES
  do
   echo "Playing $F file..."
   # Enable playing now info
   echo "$F" > /tmp/mediapi-playing-now.txt
   # Play media with omxplayer
   omxplayer -o hdmi "$F" -t "$F"
   let COUNTER=COUNTER-1
  done

 done

 sudo rm /tmp/mediapi-play-mp4.txt

else
 echo "Already playing..."
fi
