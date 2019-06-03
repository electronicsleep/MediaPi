#!/bin/bash
# Author: https://github.com/electronicsleep
# Git: https://github.com/electronicsleep/MediaPi
# Purpose: MediaPi - Media player web interface for the Rasberry Pi
# Released under the BSD license

# Next Song/Movie

ps aux | grep 'omxplayer'
kill $(ps aux | grep 'omxplayer' | awk '{print $2}')

exit 0
