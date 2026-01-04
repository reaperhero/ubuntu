

./hive  连接hive

-- 创建电商数据库
CREATE DATABASE IF NOT EXISTS ecommerce
COMMENT '电商业务数据库'
LOCATION '/user/hive/warehouse/ecommerce';

-- 使用该数据库
USE ecommerce;

-- 创建用户表
CREATE TABLE IF NOT EXISTS users (
    user_id INT,
    username STRING,
    email STRING,
    reg_date STRING,
    status STRING
)
COMMENT '用户信息表'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

-- 创建订单表（分区表）
CREATE TABLE IF NOT EXISTS orders (
    order_id BIGINT,
    user_id INT,
    product_id INT,
    quantity INT,
    amount DOUBLE
)
PARTITIONED BY (order_date STRING)
COMMENT '订单表'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t';

-- 创建产品外部表
CREATE EXTERNAL TABLE IF NOT EXISTS products (
    product_id INT,
    product_name STRING,
    category STRING,
    price DOUBLE
)
COMMENT '产品信息表'
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '|'
LOCATION '/user/hive/external/products';