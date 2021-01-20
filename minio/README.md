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

## mc安装
```
wget https://dl.min.io/client/mc/release/linux-amd64/mc
mv mc /usr/bin/
chmod +x /usr/bin/mc
```

## host管理

```
mc config host add miniohz http://192.168.1.51 BKIKJAA5BMMU2RHO6IBB V8f1CwQqAcwo80UEIJEjc5gVQUSSx5ohQ9GSrr12 --api s3v4 添加服务端
mc config host ls # 列出服务端
mc config host remove miniohz # 删除服务端
```

## bucket管理

```
mc ls play              #列出哪些桶
mc ls shlt              #列出指定桶
mc mb shlt/myun-storage #创建bucket
```

## 文件管理
```
mc ls miniohz                # 列出桶一级目录
mc cp vegeta.tgz miniohz/jia # 上传本地文件
mc ls miniohz/jia            # 列出文件
mc rm miniohz/jia/vegeta.tgz # 删除桶文件
```

## policy管理

```
mc policy list shlt/myun-storage
```