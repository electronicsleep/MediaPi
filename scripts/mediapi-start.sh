#!/bin/bash
tmux new-session 'htop' \; split-window -v 'bash /home/pi/scripts/mediapi.sh' \; split-window -h \;
