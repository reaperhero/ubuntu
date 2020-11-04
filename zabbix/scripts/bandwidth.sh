#!/bin/bash
interval=4
while true; do
  currentbandwidth=`iftop -Pp -Nn -t -L 1 -s $interval|awk -F '[ Mb]+' '/Total send rate:/ {print $4}'`
  currenttime=`date "+%Y-%m-%d %H:%M:%S"`
  if [ ! ${currentbandwidth} ]
  then
    echo $currentbandwidth 0 >>/tmp/currentbandwidth.log
  else
    echo $currenttime $currentbandwidth >>/tmp/currentbandwidth.log
  fi
  sleep 5
done
