#! /bin/sh

touch /tmp/mail-status /tmp/update-status /tmp/weechat-dzenlog /tmp/temp-sensor

info1="`date +%k:%M\ %a,%Y/%m/%d`"
info2="`acpi`"
info3="`cat /tmp/mail-status`"
info4="`rem|sed '1d'|sed '/^$/d'|wc -l` reminders"
info5="`cat /tmp/update-status`"
info6="`sensors|grep temp2|sed 's/temp2/CPU temp/'`"
info7="`cat /tmp/weechat-dzenlog|fmt -s -w 50`"
echo "^fg(red)  "$info1"  ^fg(cyan)  "$info2"  ^fg(green)  "$info3"  ^fg(orange)  "$info4"  ^fg(khaki)  "$info5"  ^fg(blue)  "$info6>>/tmp/dzenbar1
echo "^fg(white)  "$info7>>/tmp/dzenbar2
