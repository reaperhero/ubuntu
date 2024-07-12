


# 找到已经删除但是被进程占用的文件 
find /proc/*/fd -ls | grep  '(deleted)'