#!/bin/bash

# http://www.cpper.cn/2017/06/04/linux/perf/
apt install linux-tools-common
apt-get install linux-tools-4.4.0-24-generic linux-cloud-tools-4.4.0-24-generic linux-tools-generic linux-cloud-tools-generic -y
perf record -a  -g sleep 10 -o perf.data
perf report -I perf.data