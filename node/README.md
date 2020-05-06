# node教程

## npm命令
```
npm init -y                                      #初始化项目
npm install <packageName>                        #安装模块到node_modules
npm install <packageName> --force                #强制重新安装
npm update <packageName>                         #更新已安装模块
npm view <packageName>                           #查询模块信息
npm search  <packageName>                        #搜索模块
npm uninstall <packageName>                      #卸载模块       
npm config get cache                             #本地的缓存目录
npm install --cache-min Infinity <package-name>  #从缓存安装
```

安装过程：npm install从 registry 下载压缩包之后，都存放在本地的缓存目录，解压压缩包到当前项目的node_modules目录

## node知识

node是单进程单线程,V8 引擎提供的异步执行回调接口,性能非常高

- 回调函数
```
#读取到文件，异步执行回调函数
var fs = require("fs");

fs.readFile('input.txt', function (err, data) {
    if (err) return console.error(err);
    console.log(data.toString());
});

console.log("程序执行结束!");
```

## 常用模块

- http
```
var http = require('http');
http.createServer(function(request, response) {
    response.writeHead(200, { 'Content-Type': 'text/plain' });
    response.end('Hello World\n');
}).listen(8888);
console.log('Server running at http://127.0.0.1:8888/');
```
