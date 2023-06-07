# kubevela

- vela
```
wget https://github.com/kubevela/kubevela/releases/download/v1.9.0-beta.1.post1/vela-v1.9.0-beta.1.post1-darwin-amd64.zip
unzip vela-v1.9.0-beta.1.post1-darwin-amd64.zip
sudo mv darwin-amd64/vela /usr/local/bin/vela
```

- command

```
vela up -f vela.yaml  // 创建应用
vela status webservice-app // 获取应用的部署状态
vela delete webservice-app 
vela workflow resume webservice-app  // 人工审核
vela def list  -n default             // 查看模块定义列表
vela show redis    // 查看模块定义 

vela logs vela-app-with-sidecar -c count-log  // 查看 Sidecar 所输出的日志


ComponentDefinition
TraitDefinition
WorkflowStepDefinition
```


application 会根据 type 配置从 workload模板 中创建一个 component


kubevela提供了 8 种资源
workload类型的task、webservice、worker
traint类型的autoscale，metrics，rollout，route和scaler

这里出现了两个概念workload和traint，这是 OAM 定义的资源概念：

workload 类似于 k8s 的自定义资源（CR）的概念，用于基础设施人员自定义资源
component 用于定义应用程序的基本组件，可以理解成一个job,一个db或一个deployment，一个 Component 中只能引用一个workload
taint 可以用于定义 component 的运维属性，比如路由，限流熔断策略，由最终的ApplicationConfiguration将其和 component 组装
ApplicationConfiguration 定义了一个应用程序的配置，通过component和taint模板，定义一个具体的运行实例


每一个应用部署计划都由四个部分组成，分别是组件、运维能力、部署策略和工作流。其格式如下：

组件（Component）: 组件定义一个应用包含的待交付制品（二进制、Docker 镜像、Helm Chart...）或云服务。我们认为一个应用部署计划部署的是一个微服务单元，里面主要包含一个核心的用于频繁迭代的服务，以及一组服务所依赖的中间件集合（包含数据库、缓存、云服务等），一个应用中包含的组件数量应该控制在约 15 个以内。

运维特征（Trait）: 运维特征是可以随时绑定给待部署组件的、模块化、可拔插的运维能力，比如：副本数调整（手动、自动）、数据持久化、 设置网关策略、自动设置 DNS 解析等。

应用策略（Policy）: 应用策略负责定义指定应用交付过程中的策略，比如多集群部署的差异化配置、资源放置策略、安全组策略、防火墙规则、SLO 目标等。

工作流步骤（Workflow Step）: 工作流由多个步骤组成，允许用户自定义应用在某个环境的交付过程。典型的工作流步骤包括人工审核、数据传递、多集群发布、通知等。




[内置运维特征列表](https://www.bookstack.cn/read/kubevela-1.8-zh/0cc1a25d596fddb8.md)
