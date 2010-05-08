#! /bin/sh

if [ -z $1 ] 
then
	sudo $PACMAN --aur --build-as tzervo -Syu
	sudo abs
	sudo updatedb
fi

echo `$PACMAN --aur -Qu 2> /dev/null|sed '/^$/d' |sed '/Error/d'|wc -l` new updates>/tmp/update-status
dzen-update-statusbar.sh
