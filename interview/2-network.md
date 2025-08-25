

如何排查服务器网络不通的问题？（从本机到目标端口）

思路：ping <IP> (检查ICMP/IP层) -> telnet <IP> <Port> (检查TCP层) -> 本机 netstat -tunlp | grep <Port> 检查服务是否监听 -> iptables -L -n 检查防火墙 -> tcpdump 抓包分析。





详细说明TCP的三次握手过程？为什么是三次，而不是两次或四次？

过程：

SYN： Client发送SYN=1, Seq=x的包给Server。（Client进入SYN_SENT）

SYN-ACK： Server回复SYN=1, ACK=1, Ack=x+1, Seq=y的包。（Server进入SYN_RCVD）

ACK： Client发送ACK=1, Ack=y+1, Seq=x+1的包。（双方进入ESTABLISHED）

为什么是三次？

根本原因： 为了防止已失效的连接请求报文突然又传到了服务器，从而产生错误。

两次握手：如果Client发出的第一个SYN报文滞留了，Client会重发一个SYN并建立连接。之后滞留的SYN到达Server，Server会认为Client又想建立新连接，于是分配资源并等待，造成资源浪费。

三次握手可以避免此问题：那个滞留的SYN到达后，Server会回复SYN-ACK，但Client会忽略它（因为这不是它期望的），不会发送第三次ACK，Server收不到ACK，超时后就会关闭这个半连接，不会浪费资源。

详细说明TCP的四次挥手过程？为什么TIME_WAIT状态需要等待2MSL？

过程：

FIN： A发送FIN=1, Seq=u的包给B，表示A没有数据要发送了。（A进入FIN_WAIT_1）

ACK： B收到FIN，发送ACK=1, Ack=u+1的包给A。（B进入CLOSE_WAIT，A收到后进入FIN_WAIT_2）

FIN： B处理完所有数据后，发送FIN=1, Seq=w, ACK=1, Ack=u+1的包给A。（B进入LAST_ACK）

ACK： A收到FIN后，发送ACK=1, Ack=w+1的包给B。（A进入TIME_WAIT，等待2MSL后关闭；B收到后立即关闭）

为什么需要TIME_WAIT和2MSL？

可靠地终止连接： 确保A发送的最后一个ACK能到达B。如果ACK丢失，B会重传FIN，A在2MSL时间内还能收到并重传ACK。

让旧连接的所有报文在网络中消失： 防止之前连接的延迟报文被新建立的相同四元组（源IP、源端口、目的IP、目的端口）的连接错误接收。

TCP如何保证可靠性？

序列号与确认应答（Seq/Ack）

超时重传

连接管理（三次握手、四次挥手）

流量控制（滑动窗口，接收方通过通告窗口大小来控制发送方速率）

拥塞控制（慢启动、拥塞避免、快重传、快恢复）


HTTPS 的工作流程是什么？

答案：1) Client Hello；2) Server Hello + Certificate；3) Client 验证证书，生成预主密钥并用证书公钥加密发送；4) Server 用私钥解密得到预主密钥；5) 双方根据预主密钥生成会话密钥；6) 使用对称加密进行安全通信。


TCP HTTP 区别