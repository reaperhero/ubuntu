```
~/Library/Preferences/jetbrains.{xxxx}.{xxxx}.plist
~/Library/Preferences/{xxxxx}/eval/*.key
~/Library/Preferences/{xxxxx}/options/other.xml
~/Library/Application\ Support/JetBrains/{xxxxxx}/eval/*.key
~/Library/Application\ Support/JetBrains/{xxxxxx}/options/other.xml


find  ~/Library/Preferences/ -name "*jetbrains*plist"|xargs rm -fr
find  ~/Library/Preferences/ -name "*key"|xargs  rm -fr
find  ~/Library/Preferences/ -name "*other.xml"|xargs  rm -fr
find ~/Library/Application\ Support/JetBrains  -name "*key"|xargs  rm -fr
find ~/Library/Application\ Support/JetBrains  -name "*other.xml*"|xargs  rm -fr

GOPROXY=https://goproxy.cn,direct;GOPRIVATE=git.com



```

[Eval Reset](https://zhuanlan.zhihu.com/p/312951091)
