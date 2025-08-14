[vastbase@node227] /home/vastbase/local/vastbase/bin/vsql -h 127.0.0.1 -p 5432 -U vastbase -d postgres  -W '密码'

postgres=#  create user manlu password '密码' ;

postgres=#  alter user manlu sysadmin connection limit 1000;

postgres=#  CREATE DATABASE manlu WITH ENCODING='UTF8' OWNER=manlu;   

postgres=#  \l   # 查看有哪些库

postgres=#  \dt  # 查看有哪些表
postgres=#  \d dt_dashboard;  # 查看表结构

[vastbase@node227] /home/vastbase/local/vastbase/bin/vsql -h 127.0.0.1 -p 5432 -U dtsmart -W '密码' -d manlu -f 1.sql  # 执行sql