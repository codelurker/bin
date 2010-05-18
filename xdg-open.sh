#! /bin/sh

background=no

while getopts "b" opt
do
	case "$opt" in
		b) background=yes
			shift
			;;
	esac
done

command=`$XDG_OPEN -a $HOME/.local/share/applications/extensions.cache -c "$@"`
[ $background == "yes" ] && command="$command &"
eval `echo "$command" | sed 's/sh -c/$TERMINAL -e/'`
