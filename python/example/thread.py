import threading
import time

def worker():
    print("Worker thread started")
    time.sleep(2)
    print("Worker thread finished")

# 创建线程对象
t = threading.Thread(target=worker)

# 启动线程
t.start()

print("Main thread waiting for worker thread to finish...")
# 主线程等待工作线程结束
t.join()
print("Main thread continues after worker thread finished.")