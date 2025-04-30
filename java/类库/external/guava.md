
```
<dependency>
    <groupId>com.google.guava</groupId>
    <artifactId>guava</artifactId>
    <version>32.1.2-jre</version>
</dependency>
```

```
import com.google.common.collect.ImmutableList;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.ImmutableSet;

public class ImmutableCollectionExample {
    public static void main(String[] args) {
        // 创建不可变列表
        ImmutableList<String> immutableList = ImmutableList.of("apple", "banana", "cherry");
        System.out.println("不可变列表: " + immutableList);

        // 创建不可变集合
        ImmutableSet<String> immutableSet = ImmutableSet.of("red", "green", "blue");
        System.out.println("不可变集合: " + immutableSet);

        // 创建不可变映射
        ImmutableMap<String, Integer> immutableMap = ImmutableMap.of("one", 1, "two", 2, "three", 3);
        System.out.println("不可变映射: " + immutableMap);
    }
}
```