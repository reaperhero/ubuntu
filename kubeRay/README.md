三个自定义资源定义（CRD），分别是RayCluster、RayJob和RayService。这些资源帮助用户轻松运行各种工作负载。

RayCluster：KubeRay完全管理RayCluster的生命周期，包括集群的创建/删除、自动扩展和故障容错。
RayJob：KubeRay自动创建RayCluster并在集群就绪时提交作业，还可以配置RayJob在作业完成后自动删除RayCluster。
RayService：由RayCluster和Ray Serve部署图组成，提供RayCluster的零停机升级和高可用性。



Ray 生态中包含了 Ray Data、Ray Train、Ray Tune、Ray Serve 等 AI 库，这些库底层包装了 Ray Core 允许客户高效利用 Ray 集群的分布式执行特性。