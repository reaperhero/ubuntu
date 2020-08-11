# mongodb

## curd

```
mongo

mongodb://localhost

> show dbs
local  0.078GB
test   0.078GB

> use local
switched to db local

> use runoob
switched to db runoob  # 如果数据库不存在，则创建数据库

> db.dropDatabase()
{ "dropped" : "runoob", "ok" : 1 } # 删除当前数据库

> db.createCollection("runoob")     # 先创建集合，类似数据库中的表
> show tables                       # show collections 命令会更加准确点
runoob
> db.runoob.drop()
true



> db.createCollection("mycol", { capped : true, autoIndexId : true, size : 6142800, max : 10000 } ) # 创建固定集合 mycol
{ "ok" : 1 }

> db.mycol2.insert({"name" : "菜鸟教程"})  # 插入文档

> db.col2.find() # 查询文档
{"name" : "菜鸟教程"}

> db.col2.update({'name':'菜鸟教程'},{$set:{'name':'MongoDB'}}) # 更新文档

> db.col.remove({'title':'MongoDB 教程'}) # 删除文档

>db.mycol2.drop()  # 删除集合 mycol2
true
```

