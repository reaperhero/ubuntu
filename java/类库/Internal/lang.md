java.lang包

java.lang：java.lang包是Java的核心类库，包含了Java语言的基本类和接口。其中最重要的类是Object类，它是所有类的父类。此外，还包括String、StringBuilder、Thread、Math等常用类和接口。

String类提供了字符串操作的方法，如连接、截取、替换等。
StringBuilder类用于动态拼接字符串，是可变的字符串序列。
Thread类用于创建和管理线程，实现并发编程。
Math类提供了数学运算相关的方法，如求平方根、取整、随机数生成等


- String
```
String str1 = "Hello";
String str2 = "World";

// 字符串拼接
String str3 = str1 + " " + str2;
System.out.println(str3);

// 获取字符串长度
int length = str3.length();
System.out.println("字符串长度: " + length);

// 字符串查找
int index = str3.indexOf("World");
System.out.println("'World' 的索引位置: " + index);

// 字符串替换
String newStr = str3.replace("World", "Java");
System.out.println("替换后的字符串: " + newStr);
```

- Integer
```
// 字符串转整数
String numStr = "123";
int num = Integer.parseInt(numStr);
System.out.println("字符串转整数: " + num);

// 整数转字符串
String str = Integer.toString(num);
System.out.println("整数转字符串: " + str);

// 最大值和最小值
System.out.println("Integer 最大值: " + Integer.MAX_VALUE);
System.out.println("Integer 最小值: " + Integer.MIN_VALUE);
```

- Math
```
// 求绝对值
int num = -10;
int absNum = Math.abs(num);
System.out.println("绝对值: " + absNum);

// 求最大值
int max = Math.max(10, 20);
System.out.println("最大值: " + max);

// 求平方根
double sqrt = Math.sqrt(25);
System.out.println("平方根: " + sqrt);

// 生成随机数
double random = Math.random();
System.out.println("随机数: " + random);
```

- System
```
// 获取当前时间戳
long currentTimeMillis = System.currentTimeMillis();
System.out.println("当前时间戳: " + currentTimeMillis);

// 输出信息到控制台
System.out.println("这是一条输出信息");

// 终止当前正在运行的 Java 虚拟机
// System.exit(0)
```