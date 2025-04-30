
```
 <dependency>
    <groupId>org.apache.zookeeper</groupId>
    <artifactId>zookeeper</artifactId>
    <version>3.4.6</version>
</dependency>
```


```
import org.apache.zookeeper.WatchedEvent;
import org.apache.zookeeper.Watcher;
import org.apache.zookeeper.ZooKeeper;
import java.io.IOException;
import java.util.concurrent.CountDownLatch;

public class ZKConnectExample {
    private static final String ZK_SERVER = "localhost:2181";
    private static final int SESSION_TIMEOUT = 5000;
    private static final String LOCK_PATH = "/distributed_lock";
    private ZooKeeper zk;
    private String myNode;

    public DistributedLock() {
        try {
            final CountDownLatch latch = new CountDownLatch(1);
            zk = new ZooKeeper(ZK_SERVER, SESSION_TIMEOUT, new Watcher() {
                @Override
                public void process(WatchedEvent event) {
                    if (event.getState() == Watcher.Event.KeeperState.SyncConnected) {
                        latch.countDown();
                    }
                }
            });
            latch.await();
            Stat stat = zk.exists(LOCK_PATH, false);
            if (stat == null) {
                zk.create(LOCK_PATH, new byte[0], ZooDefs.Ids.OPEN_ACL_UNSAFE, CreateMode.PERSISTENT);
            }
        } catch (IOException | InterruptedException | KeeperException e) {
            e.printStackTrace();
        }
    }

    public boolean tryLock(long timeout, TimeUnit unit) throws InterruptedException {
        try {
            myNode = zk.create(LOCK_PATH + "/lock-", new byte[0], ZooDefs.Ids.OPEN_ACL_UNSAFE,
                    CreateMode.EPHEMERAL_SEQUENTIAL);
            List<String> children = zk.getChildren(LOCK_PATH, false);
            Collections.sort(children);
            String smallestNode = children.get(0);
            if (myNode.endsWith(smallestNode)) {
                return true;
            } else {
                String prevNode = children.get(children.indexOf(myNode) - 1);
                CountDownLatch latch = new CountDownLatch(1);
                Watcher watcher = new Watcher() {
                    @Override
                    public void process(WatchedEvent event) {
                        if (event.getType() == Watcher.Event.EventType.NodeDeleted &&
                                event.getPath().equals(LOCK_PATH + "/" + prevNode)) {
                            latch.countDown();
                        }
                    }
                };
                zk.exists(LOCK_PATH + "/" + prevNode, watcher);
                latch.await(timeout, unit);
                return latch.getCount() == 0;
            }
        } catch (KeeperException e) {
            throw new InterruptedException(e.getMessage());
        }
    }

    public void unlock() {
        try {
            if (myNode != null) {
                zk.delete(myNode, -1);
            }
        } catch (KeeperException | InterruptedException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        DistributedLock lock = new DistributedLock();
        try {
            if (lock.tryLock(5, TimeUnit.SECONDS)) {
                try {
                    System.out.println("获取到锁，执行临界区代码");
                    // 模拟临界区操作
                    Thread.sleep(3000);
                } finally {
                    lock.unlock();
                    System.out.println("释放锁");
                }
            } else {
                System.out.println("获取锁失败");
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}

```