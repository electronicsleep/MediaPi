#!/bin/bash
tmux new-session 'htop' \; split-window -v 'tail -f /home/pi/scripts/mediapi*log' \; split-window -h \;
