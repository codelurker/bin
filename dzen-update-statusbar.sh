#! /bin/sh

touch /tmp/mail-status /tmp/update-status /tmp/weechat-dzenlog /tmp/temp-sensor

info1="`cat /tmp/mail-status`"
info2="`rem|sed '1d'|sed '/^$/d'|wc -l` reminders"
info3="`cat /tmp/update-status`"
info4="`cat /tmp/weechat-dzenlog|fmt -s -w 50`"
echo "^fg(green)  "$info1"  ^fg(orange)  "$info2"  ^fg(khaki)  "$info3"  ^fg(cyan)  "$info4"">>/tmp/dzenbar
