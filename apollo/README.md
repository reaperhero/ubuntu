# apollo

## 安装

configservice服务里面有eureka，adminservice需要注册到eureka中。portal在eureka能找到对应的端口才会显示环境列表

```
docker-compose -f docker-compose up -d
```

- 如何修改部门信息

apolloportaldb.serverconfig
```
[{"orgId":"bumen1","orgName":"部门1"},{"orgId":"bumen2","orgName":"部门2"},{"orgId":"bumen3","orgName":"部门3"}]
```
