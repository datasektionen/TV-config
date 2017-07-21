#!/bin/bash
tmp=$(($1 - 1))
wpos=$(($tmp * 1920)),0 #TODO change 2560 to 1920
rm -r /home/tv/monitor/$1
google-chrome --app="https://tv.datasektionen.se/slideshow/$1" --no-first-run --window-position=$wpos --kiosk --user-data-dir=/home/tv/monitor/$1