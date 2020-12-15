#!/bin/bash

NR>1
awk '{sum+=$1} END {print "Sum = ", sum}'   # 求和
awk '{print $(NF-3)}'                       # 打印倒数第3列
awk '{if($1 !~ /bugu/) print $1 }'          # $1不匹配
awk '{if($6<$7) print $1}' 				    # 列比较
awk '{if(NR>10 && NR<20 ) print $1}'        # 多个条件
awk '{if($(NF-4) < 1 && $7 !~ /dataapi/) print $7 " " $(NF-4) }' # 多个正则条件

awk '{print $NF}'         最后一列