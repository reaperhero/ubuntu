

https://juejin.cn/post/7196689729608548413


# 常用语句

select * from all_Objects where owner ='TEST' and object_type='TABLE' and Object_name like '%HC%';   # 检查数据库表是否存在

select DBMS_METADATA.GET_DDL('TABLE','数据库表') from dual;   # 查看建表语句


alter table "user" add column("is_del" CHAR(1));
comment on column "user" ."is_del" is '删除标志，1是0否';    # 新增字段


alter table "user" rename column "name" to "user_name";   # 重命名字段

ALTER TABLE "USER" MODIFY  "CREATER_ID" NULL;      # 设置字段默认值

ALTER TABLE "USER" MODIFY  USER_NAME  VARCHAR(150);   # 修改字段长
alter table "USER" modify  DFQZ int;                  # 修改字段类型(慎用)


# tips

```

设置CASE_SENSITIVE = 0; 可以兼容mysql（大佬说的，还没试过）
```