#!/usr/bin/env bash

unclutter &

# https://unix.stackexchange.com/a/771693
MTIME=50
for ((i=0; i<${MTIME}; i++)); do
  read -r DUMMY DUMMY IS_OVERVIEW <<< "$(dbus-send --print-reply=literal --session --dest=org.gnome.Shell --type=method_call /org/gnome/Shell org.freedesktop.DBus.Properties.Get string:org.gnome.Shell string:OverviewActive)"
  if [[ "${IS_OVERVIEW}" = "true" ]] ; then
    /usr/bin/dbus-send --session --dest=org.gnome.Shell --type=method_call /org/gnome/Shell org.freedesktop.DBus.Properties.Set string:org.gnome.Shell string:OverviewActive variant:boolean:false
    break
  fi
  sleep 0.1
done

for i in 0 1 2; do
	datadir=/tmp/monitor-$i
	mkdir $datadir
	chromium --kiosk --no-first-run "https://tv.datasektionen.se/slideshow/$(($i+1))" \
		--window-position="$(($i*1920)),0" \
		--user-data-dir="$datadir" &
done
