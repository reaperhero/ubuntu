# playbook


capistrano使用教程

- 自定义创建文件夹、文件

```
[root@testservice-13533-osp32 deploy]# cat config.json
{
    "dir": [
        "extra_dir1"
    ],
    "file": [
        "extra_1.txt"
    ]
}
```

- 运行教程

```
ansible-playbook capistrano.yaml --extra-vars "app_name=app1 variable_host=主机组名称" -v
```
