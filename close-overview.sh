#!/usr/bin/sh

# Monitoring time in tenths of seconds
MTIME=50
for ((i=0; i<${MTIME}; i++)); do
  read -r DUMMY DUMMY IS_OVERVIEW <<< "$(dbus-send --print-reply=literal --session --dest=org.gnome.Shell --type=method_call /org/gnome/Shell org.freedesktop.DBus.Properties.Get string:org.gnome.Shell string:OverviewActive)"
  if [[ "${IS_OVERVIEW}" = "true" ]] ; then
    /usr/bin/dbus-send --session --dest=org.gnome.Shell --type=method_call /org/gnome/Shell org.freedesktop.DBus.Properties.Set string:org.gnome.Shell string:OverviewActive variant:boolean:false
    exit
  fi
  sleep 0.1
done
