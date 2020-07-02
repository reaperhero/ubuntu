#!/bin/bash
export PATH=${PATH}


# 获取cpu idle 
# 88.94 90.00 89.90 85.58 89.80
logicStatus=`sar -P ALL 1 1|awk 'NR>2{ if($NF>0||$NF==id) print $NF}'|awk -v RS= '{gsub(/\n/, " "); {print $0}}'|head -1`
echo ${logicStatus}

# 获取内存使用率
# 43
free_Use=`free -m|awk 'NR==2{ print int($3 / $2 * 100)}'`
echo ${free_Use}

# 获取磁盘最高使用率

disk_Use=`df -h |sort -nrk 5 -nrk 2|awk -F "[ %]+" 'NR==1{print $(NF-1)}'`
echo ${disk_Use}
