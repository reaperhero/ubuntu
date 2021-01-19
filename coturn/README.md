# coturn

https://www.cnblogs.com/yjmyzz/p/how-to-install-coturn-on-ubuntu.html


架构： 

Relay server即为turn中继服务器

![](https://img2018.cnblogs.com/blog/27612/201907/27612-20190706223310279-23789106.png)

打洞： 通过收集NAT背后peer端(即：躲在路由器或交换机后的电脑）对外暴露出来的ip和端口，找到一条可穿透路由器的链路。stun/turn服务器通常要部署在公网上，能被所有peer端访问到