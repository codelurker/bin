#! /bin/sh

fifo="/tmp/mplayer"
mkfifo $fifo
mplayer "$@" <$fifo &
echo -n "<" > /tmp/mplayer
tmux rename-window mplayer

mplpid=$!

IFS=""
while [ -e /proc/"$mplpid" ]
do 
  if read -s -t1 -n1  i
  then 
    echo -n -e "$i" >>$fifo; 
  fi
done

rm $fifo
