
https://blog.csdn.net/CarolynXu/article/details/127864050

[root@node239 ~]# ps -ef|grep sleep
root      79712  78338  0 15:00 pts/0    00:00:00 sleep 100

[root@node239 ~]# ausearch -sc kill|grep -C 10 -E "79712"
----
time->Thu May  8 15:01:40 2025
type=PROCTITLE msg=audit(1746687700.630:7382563): proctitle=737368643A20726F6F74407074732F31
type=OBJ_PID msg=audit(1746687700.630:7382563): opid=79712 oauid=0 ouid=0 oses=60269 ocomm="sleep"
type=SYSCALL msg=audit(1746687700.630:7382563): arch=c000003e syscall=62 success=yes exit=0 a0=13760 a1=9 a2=0 a3=7fff2a941760 items=0 ppid=79685 pid=79688 auid=0 uid=0 gid=0 euid=0 suid=0 fsuid=0 egid=0 sgid=0 fsgid=0 tty=pts1 ses=60299 comm="bash" exe="/usr/bin/bash" key=(null)


opid: 被杀死的pid
oauid=0 和 ouid=0 说明操作的审计用户 ID 和实际用户 ID 都是 0，即 root 用户。
oses=60269 是操作会话 ID
ocomm="sleep" 指出操作的进程命令名为 sleep，意味着涉及到 sleep 进程的操作
syscall=62 代表执行的系统调用编号为 62（具体的系统调用名称可以通过系统调用表查询 ）。
success=yes 表明系统调用成功执行，exit=0 表示系统调用的返回值为 0 
ppid=79685 是父进程 ID，pid=79688 是当前进程 ID 
comm="bash" 是进程命令名，exe="/usr/bin/bash" 是可执行文件路径，表明该操作由 /usr/bin/bash 进程发起



