# 文件数打开太多故障
```
ulimit -a ｜grep 'open files' //查看单个程序的限制
cat /etc/security/limits.conf   //修改单个程序的限制

cat /proc/sys/fs/file-max   //查看系统总限制
cat /proc/sys/fs/file-nr    //系统当前使用的文件句柄数量
lsof -p 24094|wc -l  //查看进程打开的文件数
```