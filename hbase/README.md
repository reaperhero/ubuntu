# hbase


## 增删改查

> hbase shell

- create table

```
create 'student','id','info'  # 创建表
list    # 列出表

```

- add row

```
put 'student','1001','info:name','Tom'
put 'student','1001','info:age','16'
```

- select row

```
get 'student','1001' # 查一列
scan 'student‘       # 查所有
```

- delete table

```
disable 'student’
drop 'student’
```