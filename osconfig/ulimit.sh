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


cat > /etc/security/limits.conf << EOF> 永久修改
*  soft   nofile          65535
*  hard   nofile          65535
EOF

# soft   nofile 不能大于硬限制数
# hard   nofile  不能大于/proc/sys/fs/nr_open


root@mrtc:/proc/self# ulimit -a  # 显示当前的各种用户进程限制,后面的缩写用于修改
core file size          (blocks, -c) 0
data seg size           (kbytes, -d) unlimited
scheduling priority             (-e) 0
file size               (blocks, -f) unlimited
pending signals                 (-i) 64020
max locked memory       (kbytes, -l) 64
max memory size         (kbytes, -m) unlimited
open files                      (-n) 1024
pipe size            (512 bytes, -p) 8
POSIX message queues     (bytes, -q) 819200
real-time priority              (-r) 0
stack size              (kbytes, -s) 8192
cpu time               (seconds, -t) unlimited
max user processes              (-u) 64020
virtual memory          (kbytes, -v) unlimited
file locks                      (-x) unlimited

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