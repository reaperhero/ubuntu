


# 登陆
clickhouse-client --host localhost --port 9000 --user default  --password 123456 --multiline

# 创建数据库
create database if not exists test;
show databases;
# 使用某个数据库
use test;

# 建表
create table if not exists test.t_order
(
  id Int64 COMMENT '订单id', 
  datetime DateTime COMMENT '订单日期',
  name String COMMENT '商品名称',
  price Decimal32(2) COMMENT '商品价格',
  user_id Int64 COMMENT '用户id'
) engine = MergeTree 
partition by toYYYYMM(datetime)
order by id 

insert into t_order values (1, '2021-03-09 21:42:00', '大力丸', 999.99, 202003090001)

select * from t_order order by id desc


# 增加表的列
alter table t_order add column addr String;

# 修改列
alter table t_order modify column user_id String;

# 删除列
alter table t_order drop column addr;

# 删除数据
alter table t_order delete where id = 2;

# 修改数据
alter table t_order update price = 0.99 where id = 1;

# 删除分区
alter table t_order drop partition '202103';  # 建表的时候使用了partition by toYYYYMM(datetime)数据是按照月进行分区的,那么刚才插入的数据都在这个分区,删除了整个分区的数据,则就没数据撩,一般用于定时删除数据

# 查看表结构
desc t_order;

# 删除表
drop table t_order;

# 直接查询
clickhouse --password 123456 --query "show databases;"

# 执行多行查询 --multiquery
clickhouse-client --password 123456 --multiquery --query "select * from system.clusters; show databases;"

# 将查询结果导出csv文件
clickhouse-client --password 123456 --query "select * from system.clusters limit 1" >/tmp/result.csv

# kill session
KILL QUERY WHERE query_id = '<id>';
