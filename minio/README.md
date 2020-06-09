# minio使用教程

mc --help
```
ls       列出文件和文件夹。
mb       创建一个存储桶或一个文件夹。
cat      显示文件和对象内容。
pipe     将一个STDIN重定向到一个对象或者文件或者STDOUT。
share    生成用于共享的URL。
cp       拷贝文件和对象。
mirror   给存储桶和文件夹做镜像。
find     基于参数查找文件。
diff     对两个文件夹或者存储桶比较差异。
rm       删除文件和对象。
events   管理对象通知。
watch    监视文件和对象的事件。
policy   管理访问策略。
config   管理mc配置文件。
update   检查软件更新。
version  输出版本信息。
```

## host管理

```
mc config host add minio http://192.168.1.51 BKIKJAA5BMMU2RHO6IBB V7f1CwQqAcwo80UEIJEjc5gVQUSSx5ohQ9GSrr12 --api s3v4 添加服务端
mc config host ls # 列出服务端
mc config host remove shlt #删除服务端
```

## bucket管理

```
mc ls shlt              #列出服务端bucket
mc mb shlt/myun-storage #创建bucket
```

## policy管理

```
mc policy list shlt/myun-storage
```