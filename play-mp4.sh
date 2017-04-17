#!/bin/bash

# Author: https://github.com/electronicsleep
# Git: https://github.com/electronicsleep/MediaPi
# Date: 03/15/2016
# Purpose: Movie Looper for the Rasberry Pi
# Released under the BSD license

# Play the MP4 files in a directory 1 million times

### MEDIA LOCATIONS ###

#UPDATE CAMERA INFO
USB_GOPRO=/media/0000-AAAA/DCIM/100GOPRO
#USB INFO
USB_NAME=/media/FLASHDEVICE


if [ -a /tmp/play-mp4.txt ]; then

 PLAYLIST=$(cat /tmp/play-mp4.txt)

 if [ -a /tmp/playing-mp4.txt ]; then
  echo "playing already, exit"
  exit
 fi

 rm /tmp/play-mp4.txt
 touch /tmp/playing-mp4.txt

 FILES=/media/FLASHDEVICE/video/*

 ### PLAYLISTS USING INFO FROM TMP FILE

 if [ $PLAYLIST == 'raw-footage' ]; then
  FILES=$USB_NAME/video/raw-footage/*.mp4
 elif [ $PLAYLIST == 'relax' ]; then
  FILES=$USB_NAME/video/relax/*.mp4
 elif [ $PLAYLIST == 'gopro-sdcard' ]; then
  FILES=$USB_GOPRO/*.mp4
 else
  FILES=$USB_NAME/video/featured/*.mp4
 fi

 echo $PLAYLIST
 echo $FILES


 ### PLAY ALL THE MOVIES 1 MILLION TIMES

 COUNTER=1000000
 until [ $COUNTER -lt 1 ]; do

  for F in $FILES
  do
   echo "Playing $F file..."
   # Enable playing now info
   echo "$F" > /tmp/playing-now.txt
   # Play media with omxplayer
   omxplayer -o hdmi "$F" -t "$F"
   let COUNTER=COUNTER-1
  done

 done

 rm /tmp/play-mp4.txt
 rm /tmp/playing-mp4.txt

fi
