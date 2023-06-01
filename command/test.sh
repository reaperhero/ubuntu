#!/bin/bash
if [[ "5" > "4" ]] && [[ "1" == "1" ]] && [ -f "user.md" ]
then
    echo 1
else
    echo 2

fi


echo 3


if [ -z "$pid" ]
then 
	echo "pid not exist";
	exit 1;
else
	echo $pid | grep -E -q "[[:space:]]" && echo "pid not unique" && echo 1
fi