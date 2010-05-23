#! /bin/sh

# Parse options
while getopts "t:d" options
do
	case "$options" in
		t) window_title="$OPTARG";;
		d) attach="yes";;
	esac
done

# The rest are the arguments
let index=$OPTIND-1
shift $index

# Protect the arguments in quotes
args=""
for i in "$@"
do
	args="$args \"$i\""
done

# Spawn executable in tmux
tmux has-session -t X 2>/dev/null
if [ $? -ne 0 ]
then 
	tmux new-session -d -s "X" "$args"
else
	if [ -z $window_title ]
	then
		echo 1
		tmux new-window "$args"
	else
		tmux list-windows -t X | grep "$window_title" || tmux new-window -n "$window_title" "$args"
		tmux select-window -t X:"$window_title"
	fi
fi

[ "$attach" == "yes" ] && $TERMINAL -e "tmux attach -d"
