#! /bin/sh

wmctrl -R "`wmctrl -l | cut -d ' ' -f 5-  | dmenu -i -l 10 -fn "xft:LiberationMono:size=9" -nf "#ffffff" -nb "#000000"`"
