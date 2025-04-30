

java util包
java.util包是Java编程语言中提供的一个标准类库。它包含了许多常用的工具类和数据结构，可以帮助开发者更高效地进行编程。该包下的类提供了诸如集合框架、日期与时间操作、随机数生成、排序算法等功能。

以下是一些常见的java.util包中的类：
Array- List：动态数组，实现了List接口，可以动态增加或减少元素。

LinkedList：双向链表，也实现了List接口，对于频繁插入和删除操作更高效。
HashMap：哈希表，实现了Map接口，存储键值对，并根据键的HashCode快速查找。
HashSet：基于HashMap实现的集合，不允许重复元素。
Date：表示日期和时间的类。
Calendar：提供了对日期和时间进行操作的方法。
Random：生成伪随机数的类。
Collections：提供了一组静态方法，用于对集合进行排序、查找等操作。
当然，java.util包中还有很多其他有用的类。通过引入该包，可以方便地使用这些类来完成各种编程任务。

- List
```
// 创建一个 ArrayList 对象
List<String> list = new ArrayList<>();

// 添加元素
list.add("apple");
list.add("banana");
list.add("cherry");

// 访问元素
System.out.println(list.get(1)); 

// 遍历元素
for (String fruit : list) {
    System.out.println(fruit);
}
```

- Set
```
// 创建一个 HashSet 对象
Set<String> set = new HashSet<>();

// 添加元素
set.add("dog");
set.add("cat");
set.add("dog"); // 重复元素，不会被添加

// 遍历元素
for (String animal : set) {
    System.out.println(animal);
}
```

- Map
```
// 创建一个 HashMap 对象
Map<String, Integer> map = new HashMap<>();

// 添加键值对
map.put("one", 1);
map.put("two", 2);
map.put("three", 3);

// 获取值
System.out.println(map.get("two")); 

// 遍历键值对
for (Map.Entry<String, Integer> entry : map.entrySet()) {
    System.out.println(entry.getKey() + ": " + entry.getValue());
}
```

- Random
```
// 创建一个 Random 对象
Random random = new Random();

// 生成一个 0 到 9 之间的随机整数
int randomNumber = random.nextInt(10);
System.out.println(randomNumber);
```

- Arrays
```
int[] numbers = {3, 1, 4, 1, 5, 9};

// 对数组进行排序
Arrays.sort(numbers);

// 输出排序后的数组
System.out.println(Arrays.toString(numbers));
```

- Collections
```
List<String> list = new ArrayList<>();
list.add("red");
list.add("green");
list.add("blue");

// 对列表进行排序
Collections.sort(list);
```