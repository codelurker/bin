#! /bin/sh

getmail -r gmail -r ntua
[ -z $1 ] && mutt
new_mail=`ls $HOME/../mail/inbox/new | wc -l`
echo "$new_mail new mail" >/tmp/mail-status
dzen-update-statusbar.sh
