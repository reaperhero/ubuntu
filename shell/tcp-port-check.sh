#!/bin/bash
export PATH=$PATH
nc -w 10 -z 172.16.128.230 80  > /dev/null 2>&1
if [ $? -eq 0 ]; then
      echo "Network is Open."
else
      echo "Network is Closed."
fi