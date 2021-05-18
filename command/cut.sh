#!/bin/bash

# test.txt
# No Name Mark Percent
# 01 tom 69 91
# 02 jack 71 87
# 03 alex 68 98

cut -f 1 test.txt  # 打印第1列 默认空格符为分界
cut -f2,3 test.txt # 打印第2，3列 默认空格符为分界
cut -f2 --complement test.txt # 排除第2列
cut -f2 -d";" test2.txt # 指定分隔符
cut -c1-3 test.txt      # 打印第1-3个字符
cut -c-4 test.txt       # 打印前面 4 个字符
cut -c5- test.txt       # 从第 5 个字符开始打印一直到结尾