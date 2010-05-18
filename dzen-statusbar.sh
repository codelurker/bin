#! /bin/sh

[ -e /tmp/dzenbar1 ] || mkfifo /tmp/dzenbar1
[ -e /tmp/dzenbar2 ] || mkfifo /tmp/dzenbar2
tail -f /tmp/dzenbar1|dzen2 -dock -geometry 1366x20 -fn "xft:LiberationMono:size=9:Bold" -ta c &
tail -f /tmp/dzenbar2|dzen2 -dock -geometry 1366x20 -y 748 -fn "xft:LiberationMono:size=9:Bold" -ta c &
