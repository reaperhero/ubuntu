
```
<dependency>
    <groupId>org.apache.commons</groupId>
    <artifactId>commons-lang3</artifactId>
    <version>3.12.0</version>
</dependency>


<dependency>
    <groupId>org.apache.commons</groupId>
    <artifactId>commons-io</artifactId>
    <version>2.11.0</version>
</dependency>

<dependency>
    <groupId>org.apache.commons</groupId>
    <artifactId>commons-collections4</artifactId>
    <version>4.4</version>
</dependency>
```



```
import org.apache.commons.collections4.CollectionUtils;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class CollectionUtilsExample {
    public static void main(String[] args) {
        List<String> list1 = new ArrayList<>();
        list1.add("a");
        list1.add("b");

        List<String> list2 = new ArrayList<>();
        list2.add("b");
        list2.add("c");

        // 求交集
        Collection<String> intersection = CollectionUtils.intersection(list1, list2);
        System.out.println("交集: " + intersection);

        // 求并集
        Collection<String> union = CollectionUtils.union(list1, list2);
        System.out.println("并集: " + union);
    }
}
```