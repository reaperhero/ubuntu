import numpy as np
import time

# 创建两个 5000x5000 的矩阵
size = 5000
A = np.random.rand(size, size)
B = np.random.rand(size, size)

# CPU 计算
start = time.time()
C_cpu = np.dot(A, B)
cpu_time = time.time() - start
print(f"CPU 计算时间: {cpu_time:.2f} 秒")

# GPU 计算（使用 PyTorch）
import torch
A_gpu = torch.rand(size, size, device='cuda')
B_gpu = torch.rand(size, size, device='cuda')

start = time.time()
C_gpu = torch.mm(A_gpu, B_gpu)
torch.cuda.synchronize()  # 等待 GPU 完成
gpu_time = time.time() - start
print(f"GPU 计算时间: {gpu_time:.2f} 秒")
print(f"GPU 比 CPU 快: {cpu_time/gpu_time:.1f} 倍")