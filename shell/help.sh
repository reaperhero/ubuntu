#!/bin/bash

# Add two numeric value
((sum=25+35))

#Print the result
echo $sum



if [ -e /tmp ]
then
    echo "dir exists!"
else
    echo "dir not exists"
fi

# if [ -e /tmp  ]; then echo "dir exists!"; else echo "dir not exists" fi


count=0
while [ $count -lt 5 ]
do
    echo $count
    ((count++))
done



count=0
while [ $count -lt 5 ]; do echo $count; ((count++)); done




for i in `seq 10`; do curl -v http://baidu.com; done



echo ${my_name:0:2}  # 截取字符串
echo ${#my_name}     # 获取字符串长度

