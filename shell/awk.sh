#!/bin/bash

# awk
awk -F ":" '$3==502{print $1}' /etc/passwd  # 检索用户ID值为502的用户名。
awk '{sum+=$1} END {print "Sum = ", sum}'   # 求和
awk '{print $(NF-3)}'                       # 打印倒数第3列


# sed
sed -i '/git.mudu.tv/d' /etc/hosts  # 删除保护指定内容行