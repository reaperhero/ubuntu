

top -d 1   # 查看哪个进程号，cpu使用率高
top -d 1 -p ? -H  # 根据上面的进程，查看是哪个线程
dlv attach ?   #  第一步的进程号，终端里面输入goroutine 12(第二步对应的线程)，bt



pprof


go tool pprof -http=:1234 'http://服务器地址/api/v2/debug/pprof/profile?seconds=30'
go tool pprof -http=:1234 'http://服务器地址/api/v2/debug/pprof/heap?seconds=30'