#! /bin/sh

COMMAND=`$XDG_OPEN -a $HOME/.local/share/applications/extensions.cache -c "$@"`
eval `echo "$COMMAND" | sed 's/sh -c/$TERMINAL -e/'`
