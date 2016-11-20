#!/bin/bash

if [ -a /tmp/play-mp3.txt ]; then

rm /tmp/play-mp3.txt
touch /tmp/playing-mp3.txt


#ALL FILES IN MP3 DIR
FILES=$(find /media/FLASHDEVICE/mp3/ -iname "*.mp3" -print)

for f in $FILES
do
  echo "Playing $f file..."
  omxplayer -o hdmi $f
done

rm /tmp/play-mp3.txt
rm /tmp/playing-mp3.txt

fi
