

CUE 是 JSON 的超集， 我们可以像使用 JSON 一样使用 CUE，并具备以下特性：

C 语言风格的注释
字段名称可以用双引号括起来，注意字段名称中不可以带特殊字符
可选字段末尾是否有逗号
允许数组中最后一个元素末尾带逗号
外大括号可选


- command
```
cue fmt first.cue       // 格式化 CUE 文件
cue vet first.cue -c    // 校验模型
cue export first.cue    // 渲染, 默认JSON格式
cue export first.cue --out yaml  // 渲染 YAML 格式
cue export -e g first.cue     // 导出指定变量的结果

```


- 渲染k8s yaml文件
```
cue export deployment.cue -e template --out yaml
apiVersion: apps/v1
kind: Deployment
spec:
  selector:
    matchLabels:
      app.oam.dev/component: mytest
  template:
    metadata:
      labels:
        app.oam.dev/component: mytest
    spec:
      containers:
        - name: mytest
          image: nginx:v1
```



- 数据类型

```
// float
a: 1.5

// int
b: 1

// string
c: "blahblahblah"

// array
d: [1, 2, 3, 1, 2, 3, 1, 2, 3]

// bool
e: true

// struct
f: {
 a: 1.5
 b: 1
 d: [1, 2, 3, 1, 2, 3, 1, 2, 3]
 g: {
  h: "abc"
 }
}

数组或者结构体中使用 ...  说明该对象为开放的
数组对象 [...string] ，说明该对象可以容纳多个字符串元素 
[string] 说明数组只能容纳一个类型为 string 的元素
a: string | int   // 多类型
a: *1 | int       // 默认值
a ?: int          // 可选变量



// null
j: null

#abc: string   // 自定义 CUE 类型
#abc: {        // // 自定义 CUE 复杂类型
  x: int
  y: string
  z: {
    a: float
    b: bool
  }
}


```





- 条件语句

```
price: number
feel: *"good" | string
// Feel bad if price is too high
if price > 100 {
    feel: "bad"
}
price: 200
```