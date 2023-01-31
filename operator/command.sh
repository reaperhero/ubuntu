

[参考地址](https://redhat-scholars.github.io/operators-sdk-tutorial/template-tutorial/04-go.html)


# 创建operator工程
```
operator-sdk init --domain redhat.com --repo github.com/redhat-scholars/visitors-operator

```

# 创建api
```
operator-sdk create api --group=app --version=v1 --kind=VisitorsApp --resource --controller   # 生成下面的文件

$HOME/visitors-operator/api/v1/visitorsapp_types.go            # 每次修改都需要重新make generate
$HOME/visitors-operator/controllers/visitorsapp_controller.go  # 每个 Controller 都有一个 Reconciler 对象，该对象带有实现协调循环的 Reconcile() 方法。
```
![](https://redhat-scholars.github.io/operators-sdk-tutorial/template-tutorial/_images/controllers.png)