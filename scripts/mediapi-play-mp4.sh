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
DIR=/var/www/html


if [ -a "$DIR/mediapi-play-mp4.txt" ]; then

 PLAYLIST=$(cat $DIR/mediapi-play-mp4.txt)

 if [ -a "$DIR/mediapi-playing-now.txt" ]; then
  echo "playing already, exit"
  exit
 fi

 sudo rm $DIR/mediapi-play-mp4.txt

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
 FILES=$DIR/video/*.mp4
 #fi

 echo $PLAYLIST
 echo $FILES


 ### Repeast all movies

 COUNTER=1000000
 until [ $COUNTER -lt 1 ]; do

  for FILE in $FILES
  do
   echo "Playing $FILE ..."
   # Enable playing now info
   echo "$FILE" > /var/www/html/mediapi-playing-now.txt
   # Play media with omxplayer
   omxplayer -o hdmi "$FILE" -t "$FILE"
   let COUNTER=COUNTER-1
  done

 done

 sudo rm $DIR/mediapi-play-mp4.txt

else
 echo "Already playing..."
fi
