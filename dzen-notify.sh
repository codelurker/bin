#! /bin/sh

while getopts ":t:" OPTNAME 
do
   case $OPTNAME in
      t) duration=$OPTARG ;;
   esac
done

[ $duration == "0" ] && duration=
if [ -z $duration ]; then
	events="onstart=uncollapse,grabkeys;key_Escape=exit;button1=exit"
else
	events="onstart=uncollapse;button1=exit"
fi

# Reset $@ and append to $executable
shift `echo $OPTIND-1 | bc`

lines=`echo "$@"|wc -l`
echo "$@"|dzen2 -bg orange -fg black -fn "xft:LiberationMono:size=9:Bold" -p $duration -l $lines -e "$events"
