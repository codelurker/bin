#! /bin/sh

while getopts "t:e:d" options
do
	case "$options" in
		t) window_title="$OPTARG";;
		e) executable="$OPTARG";;
		d) attach="yes";;
	esac
done

let index=$OPTIND-1
shift $index

tmux has-session -t X 2>/dev/null
if [ $? -ne 0 ]
then 
	tmux new-session -s "X" -d $executable "$@"
else
	tmux list-windows -t X | grep "$window_title" || tmux new-window -n "$window_title" -t X "$executable "$@""
	tmux select-window -t X:"$window_title"
fi

[ "$attach" == "yes" ] && $TERMINAL -e "tmux attach -d"
