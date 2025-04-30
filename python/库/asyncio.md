
asyncio 是 Python 用于编写异步 I/O 代码的库

```
import asyncio


async def task1():
    print("Task 1 started")
    await asyncio.sleep(2)
    print("Task 1 finished")


async def task2():
    print("Task 2 started")
    await asyncio.sleep(1)
    print("Task 2 finished")



async def main():
    # 并发运行多个协程
    await asyncio.gather(task1(), task2())


# 获取事件循环
loop = asyncio.get_event_loop()
# 运行主协程
loop.run_until_complete(main())
# 关闭事件循环
loop.close()

```