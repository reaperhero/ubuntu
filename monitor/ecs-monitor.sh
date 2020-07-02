#!/bin/bash

cpuusage=`top -n 1|awk -F '[ %]+' 'NR==3 {print $3}'`

echo $cpuusage