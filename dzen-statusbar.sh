#! /bin/sh

[ -e /tmp/dzenbar ] || mkfifo /tmp/dzenbar
tail -f /tmp/dzenbar|dzen2 -dock -geometry 1366x20 -fn "xft:LiberationMono:size=9:Bold" -ta c &
