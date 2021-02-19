# git


### 仓库初始化
```
git remote set-url origin https://github.com/test.git

git remote set-url origin https://guest:password@github.com/test.git

git branch --set-upstream-to=origin/master master
```



### git全局配置

```
git config --global url."https://guest:password@github.com/".insteadOf "https://github.com/"  # git config --global --edit 可以删除新增

```


### 有用命令

```
查询本地每个版本对应的commit 信息
git log --graph --date-order --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %C(green)(%cn)%Creset %C(cyan)(%cr)%Creset' --abbrev-commit --date=relative


git fetch origin master   //从远程的origin的master主分支上获取最新版本到origin/master分支上


git log -p master..origin/master //比较本地的master分支和origin/master分支的区别
```

- error: You have not concluded your merge (MERGE_HEAD exists)

解决办法一:保留本地的更改,中止合并->重新合并->重新拉取
```
git merge --abort
git reset --merge
git pull
```

解决办法二:舍弃本地代码,远端版本覆盖本地版本(慎重)
```
git fetch --all
git reset --hard origin/master
git fetch
```


- 回滚个人远程分支

```
git push -f 本地版本强制覆盖远程版本
```

- 公共远程分支版本回退的方法

```
正常
git revert HEAD   //撤销最近一次提交(也可以指定版本)，产生一个新的提交，虽然代码回退了，但是版本依然是向前的，所以，当你用revert回退之后，所有人pull之后，他们的代码也自动的回退




简单粗暴的回滚方法

直接从那个错误的提交的前一次拉取一份代码放到其他目录，然后将master代码全部删除，把那份新代码方进去，然后提交，果然简单粗暴啊，虽然这种方法不入流，但是，实践中发现很好使啊
```
