

Queue：FIFO 即first in first out 先进先出

LifoQueue：LIFO 即last in first out 后进先出

PriorityQueue：优先队列，级别越低，越优先

deque:双边队列


常用方法：
```
Queue.qsize() 返回队列的大小
Queue.empty()如果队列为空，返回True,反之False
Queue.full() 如果队列满了，返回True,反之False，Queue.full 与 maxsize 大小对应
Queue.get([block[, timeout]])获取队列，timeout等待时间
Queue.get_nowait() 相当于Queue.get(False)，非阻塞方法
Queue.put(item) 写入队列，timeout等待时间
Queue.task_done() 在完成一项工作之后，Queue.task_done()函数向任务已经完成的队列发送一个信号。每个get()调用得到一个任务，接下来task_done()调用告诉队列该任务已经处理完毕。
Queue.join()实际上意味着等到队列为空，再执行别的操作
```


- 先进先出队列

```
from queue import Queue
if __name__ == '__main__':
    q = Queue(maxsize=0)

    # 写入队列数据
    q.put(0)
    q.put(1)
    q.put(2)

    # 输出当前队列所有数据
    print(q.queue)
    # 删除队列数据，并返回该数据
    q.get()
```


- 后进先出队列

```
from queue import LifoQueue

if __name__ == '__main__':
    lq = LifoQueue(maxsize=0)

    # 队列写入数据
    lq.put(0)
    lq.put(1)
    lq.put(2)

    # 输出队列所有数据
    print(lq.queue)
    # 删除队尾数据，并返回该数据
    print(lq.get())
```

- 优先队列

```
from queue import PriorityQueue

if __name__ == '__main__':
    pq = PriorityQueue(maxsize=0)

    # 写入队列，设置优先级
    # 优先级设置数越小等级越高
    pq.put((9, 'a'))
    pq.put((7, 'c'))
    pq.put((1, 'd'))

    # 输出队例全部数据
    print(pq.queue)

    # 取队例数据，可以看到，是按优先级取的。
    print(pq.get())
    print(pq.queue)  # 输出：[(7, 'c'), (9, 'a')]
```    

- 双边队列

```
from collections import deque

if __name__ == '__main__':
    # 双边队列
    dq = deque(['a', 'b'])

    # 增加数据到队尾
    dq.append('c')
    # 增加数据到队左
    dq.appendleft('d')

    # 输出队列所有数据
    print(dq)
    # 移除队尾，并返回
    print(dq.pop())
    # 移除队左，并返回
    print(dq.popleft())  # 输出:deque(['d', 'a', 'b', 'c'])cd
```