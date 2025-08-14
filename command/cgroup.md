
cgroup 用于资源限制，程序启动之后，可以把pid加入cgroup



# 查看进程的cgroup
cat /proc/<PID>/cgroup

# 查看cgroup的配置
cat /sys/fs/cgroup/<subsystem>/<cgroup-name>/<setting>


