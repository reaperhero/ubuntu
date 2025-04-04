
[参考地址](https://juejin.im/post/5c8765e65188257e1b351c44)

![](https://user-gold-cdn.xitu.io/2019/3/12/16970e60791a5c78?imageView2/0/w/1280/h/960/format/webp/ignore-error/1)

服务器接收到SYN报文并返回SYN-ACK报文时，不分配一个专门的数据区，而是根据这个SYN报文计算出一个cookie值。这个cookie值作为将要返回的SYN ACK报文的初始序列号.当客户端返回一个ACK报文时，服务器根据报文头信息计算cookie，与客户端返回的确认序列号(初始序列号 + 1)进行对比，如果相同，则是一个正常连接，然后，分配资源，建立连接。
实现的关键在于cookie的计算，cookie的计算应该包含本次连接的状态信息，使攻击者不能伪造


- SYNPROXY原理

第一阶段：客户端与握手代理进行三次握手，第二步握手代理回复客户端的ACK-ACK报文携带的初始序列号（ISN1）由SYNCookie算法生成，与SYNCookie工作流程相似

第二阶段：当cookie验证通过后，握手代理充当客户端和服务端进行三次握手，并负责校正初始序列号（ISN2）和窗口大小

第三阶段：在连接建立之后握手代理负责调整客户端和服务端之间数据传输过程中的序列号和确认号



## 问题

1. 第二步握手代理回复给客户端的SYN-ACK报文的接收窗口大小为0 ？

客户端和服务器端真正建立连接前，首先，握手代理和客户端要进行三次握手，其次才是握手代理和服务端的三次握手，若是在此时，客户端发送数据过来，无疑不会被服务端正确接收。为了避免这种情况的发生，握手代理回复给客户端一个大小为0的窗口，告诉客户端“我还没有准备好接收数据”，因为此时仅仅是握手代理和客户端之间的三次握手，真正的连接尚未建立，无法传输数据。当握手代理和服务器完成了三次握手，握手代理再将服务端回复的SYN-ACK报文中真正的窗口大小透传给客户端，告诉客户端“我准备好了，可以开始传输数据了”。


2. 序列号如何计算？

第二步握手代理回复的SYN-ACK报文中所携带的初始序列号是如何产生的？这个序列号是握手代理采用SYNCookie技术计算得出的cookie值，这个cookie值根据客户端的SYN报文中的源地址、目的地址、源端口、目的端口等信息计算出来的，准确性很高，使得客户端第三次握手发来的ACK报文几乎无法被伪造。


3. 服务端回复的SYN-ACK报文中所携带的初始序列号，握手代理又如何透传给客户端？

第五步可以看出，两个ISN（ISN1、ISN2）是独立生成的，由于客户端并不知道握手代理的存在，会将握手代理发送的SYN-ACK记录在TCP连接中，在握手代理透传服务端的ACK-SYN时，携带的是服务端生成的ISN2，与之前的ISN1不一样，因此这个透传的SYN-ACK应当是不会被客户端正确接收的。那么，SYNPROXY是如何解决这个问题呢
```
1.握手代理将服务端的SYN-ACK报文去掉SYN标记，仅保留ACK标记，作为一个窗口更新动作发送给客户端；
2.对于从服务端收到的任何数据报文，在发往客户端前，调整其序列号使得与客户端握手时的ISN相适应；
3.对于从客户端收到的任何数据报文，在发往服务端前，调整其ACK使得与服务端握手时的ISN相适应。
```


4. LVS为什么要使用SYNPROXY?

Linux内核原生的ip_vs模块主要实现负载均衡功能，对DDoS攻击几乎没有防护作用，后端真实服务器一般也不具备这种攻击防御，或者防御作用不高，一旦这种攻击包被转发到后端真实服务器上，会造成后端真实服务器崩溃，LVS机器也会因此产生资源消耗，影响LVS转发性能。

