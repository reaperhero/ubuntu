#!/bin/bash


find . -name "*" | xargs -i cp {} /home/users/    # 把查询到的文件 都copy到/home/users/中去

find /var/lib/docker/containers -type f -name "*-json.log"|xargs -I files sh -c 'echo "" > $1' -- files  # 清空文件
find ./ -type f -mmin -20  -name "*INFO_log*"|xargs grep  'a755d4'   # 过过滤文件