# 内核级打开文件数限制

root@mrtc:/proc/self# sysctl fs.file-nr
fs.file-nr = 19520(已使用)		1635082(最大)

echo "fs.file-max=6553500" >>/etc/sysctl.conf 永久修改限制数









# 用户级进程打开文件数限制

root@mrtc:/proc/self# cat /proc/self/limits
Limit                     Soft Limit           Hard Limit           Units
Max cpu time              unlimited            unlimited            seconds
Max file size             unlimited            unlimited            bytes
Max data size             unlimited            unlimited            bytes
Max stack size            8388608              unlimited            bytes
Max core file size        0                    unlimited            bytes
Max resident set          unlimited            unlimited            bytes
Max processes             64020                64020                processes
Max open files            1024 (软限制数)       1048576 (硬限制数)     files
Max locked memory         65536                65536                bytes
Max address space         unlimited            unlimited            bytes
Max file locks            unlimited            unlimited            locks
Max pending signals       64020                64020                signals
Max msgqueue size         819200               819200               bytes
Max nice priority         0                    0
Max realtime priority     0                    0
Max realtime timeout      unlimited            unlimited            us


cat > /etc/security/limits.conf << EOF> 永久修改，要重启
*  soft   nofile          65535
*  hard   nofile          65535
EOF

# soft   nofile 不能大于硬限制数
# hard   nofile  不能大于/proc/sys/fs/nr_open


[root@localhost ~]# ulimit -a  # 显示当前的各种用户进程限制,后面的缩写用于修改
core file size          (blocks, -c) 0           #core文件的最大值为0,即不生成core dump。
data seg size           (kbytes, -d) unlimited   #进程的数据段可以任意大。
scheduling priority             (-e) 0
file size               (blocks, -f) unlimited   #文件可以任意大。
pending signals                 (-i) 98304       #最多有98304个待处理的信号。
max locked memory       (kbytes, -l) 32          #一个任务锁住的物理内存的最大值为32KB。
max memory size         (kbytes, -m) unlimited   #一个任务的常驻物理内存的最大值。
open files                      (-n) 1024        #一个任务最多可以同时打开1024的文件。
pipe size            (512 bytes, -p) 8           #管道的最大空间为4096字节。
POSIX message queues     (bytes, -q) 819200      #POSIX的消息队列的最大值为819200字节。
real-time priority              (-r) 0
stack size              (kbytes, -s) 10240       #进程的栈的最大值为10240字节。
cpu time               (seconds, -t) unlimited   #进程使用的CPU时间。
max user processes              (-u) 98304       #当前用户同时打开的进程（包括线程）的最大个数为98304。
virtual memory          (kbytes, -v) unlimited   #没有限制进程的最大地址空间。
file locks                      (-x) unlimited   #所能锁住的文件的最大个数没有限制。

# 查看进程打开的文件数 lsof -p <PID>|wc -l
# 查看进程起的线程数 ps -mp <PID>



# 常用配置
tail -4 /etc/security/limits.conf   
*        soft    noproc 10240  # 线程数
*        hard    noproc 10240
*        soft    nofile 10240  # 文件数
*        hard    nofile 10240

tail /etc/profile
ulimit -d unlimited
ulimit -m unlimited
ulimit -s unlimited
ulimit -t unlimited
ulimit -v unlimited
ulimit -n 4096


cat /proc/<PID>/limits # 查看进程的limit
echo -n 'Max open files=65535:65535' > /proc/<PID>/limits # 动态修改运行中进程的 limit