# strace 

# https://ma.ttias.be/strace-operation-not-permitted-ptrace_scope-incorrect/
apt install strace -y

strace -tt ls /   # 打印系统调用时的时间（时、分、秒、微秒）	
strace -tt -yy -e trace=connect,write ping -c 1 www.baidu.com   # 打印与套接字文件描述符相关的协议特定信息，以及与设备文件描述符相关的块/字符设备号。



tail -f /proc/55382/fd/1   # 查看进程的标准输出
tail -f /proc/55382/fd/2


strace -p 13357 -ewrite -o 1.log           # 运行的进程系统级别日志，被kill时有日志
strace -p 13357 -ewrite | grep 'write(1,'  # 打印运行中的进程标准输出