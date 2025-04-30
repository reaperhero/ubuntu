

- ThreadPoolExecutor 线程池
```
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

class Task implements Runnable {
    private final int taskId;

    public Task(int taskId) {
        this.taskId = taskId;
    }

    @Override
    public void run() {
        System.out.println("Task " + taskId + " is running on thread " + Thread.currentThread().getName());
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println("Task " + taskId + " is completed.");
    }
}

public class ThreadPoolExample {
    public static void main(String[] args) {
        // 创建一个固定大小为 3 的线程池
        ExecutorService executor = Executors.newFixedThreadPool(3);

        // 提交 5 个任务给线程池
        for (int i = 1; i <= 5; i++) {
            executor.submit(new Task(i));
        }

        // 关闭线程池
        executor.shutdown();
    }
}
```


- 异步任务（Future 和 Callable）

```
import java.util.concurrent.*;

class MyCallable implements Callable<Integer> {
    private final int number;

    public MyCallable(int number) {
        this.number = number;
    }

    @Override
    public Integer call() throws Exception {
        int sum = 0;
        for (int i = 1; i <= number; i++) {
            sum += i;
        }
        return sum;
    }
}

public class FutureExample {
    public static void main(String[] args) {
        ExecutorService executor = Executors.newSingleThreadExecutor();
        MyCallable callable = new MyCallable(10);

        // 提交 Callable 任务并获取 Future 对象
        Future<Integer> future = executor.submit(callable);

        try {
            // 获取任务执行结果
            Integer result = future.get();
            System.out.println("Sum from 1 to 10 is: " + result);
        } catch (InterruptedException | ExecutionException e) {
            e.printStackTrace();
        }

        executor.shutdown();
    }
}
```


- 并发集合(线程安全)
```
import java.util.concurrent.ConcurrentHashMap;

public class ConcurrentHashMapExample {
    public static void main(String[] args) {
        ConcurrentHashMap<String, Integer> map = new ConcurrentHashMap<>();

        // 启动多个线程向 Map 中添加元素
        Thread t1 = new Thread(() -> {
            for (int i = 0; i < 1000; i++) {
                map.put("Key" + i, i);
            }
        });

        Thread t2 = new Thread(() -> {
            for (int i = 1000; i < 2000; i++) {
                map.put("Key" + i, i);
            }
        });

        t1.start();
        t2.start();

        try {
            t1.join();
            t2.join();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        System.out.println("Map size: " + map.size());
    }
}
```