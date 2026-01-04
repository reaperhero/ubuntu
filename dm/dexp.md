

# 备份单库

使用说明

https://eco.dameng.com/document/dm/zh-cn/pm/dexp-logical-export.html

备份单库
```
dexp USERID=SYSDBA/SYSDBA001@172.16.124.190:5236 FILE=sysdba.dmp DIRECTORY=/data/dtstack/backup  LOG=sysdba.log SCHEMAS=SYSDBA
```


备份全库
```
./dexp USERID=SYSDBA/Dmsys_123 FILE=db_str.dmp LOG=db_str.log FULL=Y DIRECTORY=/mnt/data/dexp
```


