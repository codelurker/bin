#! /bin/sh

# Make fifo and start streaming
fifo="/tmp/mplayer"
[ -e $fifo ] || mkfifo $fifo
mplayer "$@" <$fifo &
echo -n "<" > /tmp/mplayer
mplpid=$!

# Rename tmux window
tmux rename-window mplayer

# The rest is for accepting output from terminal
IFS=""
while [ -e /proc/"$mplpid" ]
do 
  if read -s -t1 -n1  i
  then 
    echo -n -e "$i" >>$fifo; 
  fi
done

rm $fifo
