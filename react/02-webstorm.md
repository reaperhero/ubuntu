# 无法识别@目录

- 方法1

webpack项目

设置, 语言和框架 ---> JavaScript ---> webpack 设置文件路径webpack.config.js
```
const path = require('path')
 
module.exports = {
  context: path.resolve(__dirname, './'),
  resolve: {
    extensions: ['.js', '.vue', '.json'],
    alias: {
      '@/': path.resolve('src'),
    }
  }
}
```


- 方法2
非webpack项目，添加 jsconfig.json
在项目根目录下添加文件名为 jsconfig.json 的文件，文件内容参考下方:
```
{
  "compilerOptions": {
    "baseUrl": "./",
    "paths": {
        "@/*": ["src/*"]
    }
  },
  "exclude": ["node_modules", "dist"]
}
```
