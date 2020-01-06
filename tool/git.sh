创建新的工程：
1、创建文件夹
2、进入文件夹：git init
3、与远端工程联系起来：git remote add origin git@github.com:mobinsheng/git-test
或者：git remote add origin https://github.com/mobinsheng/git-test
4、添加新文件：git add filename
5、提交到本地库：git commit -m “comment”
6、查看工程状态：git status
7、丢弃本地的修改：git checkout filename
8、查看修改的内容：git diff
9、查看历史：git log
10、版本之间切换：git reset --hard id
11、查看命令记录：git reflog
12、如果已经add文件了，那么可以使用下面命令撤销：git reset HEAD filename，然后再用：git checkout filename
13、把本地推送到远程：
第一次：git push -u origin master 
其他：git push oringin master
如果推送不了那么可能需要：git push -u origin +master


已经存在的工程：
1、克隆：git clone https://github.com/mobinsheng/git-test
2、修改提交：git add filename
3、提交：git commit -m ”comment“
4、推送到远程库：git push oringin master
5、拉取远程最新代码：git pull
6、请注意：在拉远程最新代码之前，需要把本地的代码commit了
7、拉取代码之后可能会出现冲突：那么需要手动合并代码，再次commit，然后push
8、删除文件：rm filename，git rm filename ，git commit
9、如果删除了文件但是尚未commit，那么还可以使用 git checkout filenamelaos恢复删除文件
10、如果本地已经commit了，那么可以使用 git reset  HEAD id 来恢复/git reset --hard commit_id

分支管理：
1、创建分支：git branch dev
2、查看分支：git branch
3、切换到分支：git checkout dev
4、把分支推送到远端：git push origin dev
5、拉取远端分支：git fetch --all ，然后使用git checkout切换分支，再使用git pull dev
或者：git checkout -b dev origin/dev
6、合并分支，先切换到 git checkout master，git merge dev
7、删除分支：git branch -d dev
8、合并之后需要推送到远端：git push origin master
9、同时另外的工程需要在master中pull：git pull origin master
10、查看远程分支：git branch -r
11、删除远程分支：git branch -r -d origin/dev

如果出现：error: 无法推送一些引用到，那么执行：git push origin HEAD:refs/for/master  

子模块管理：
1、有一些项目clone之后还要更新子模块，那么按照下面的步骤进行处理：
2、git submodule init
3、git submodule update

假如有一个分支（假设叫做evelop）已经被你，修改的面目全非，但是你暂时还不能push develop上（因为还没有完全测试），而且你要创建另一个分支feature（基于develop）去存放你的代码：
1、在本地develop上 git add 、git commit，提交代码
2、拉去远程的分支：git pull origin feature
3、创建本地分支：git checkout -b feature origin/feature
4、切换到feature分支：git checkout feature
5、把本地的develop分支合并到feature：git merge develop
6、推送到服务器：git push origin feature

多分支管理，假设有一个remote分支——https://github/group/project.git，是开发团队的master分支，大家都不能直接push代码上去，我们只好每一个人fork一个分支，它是我们自己开发时用到的master分支，那么我们应该按照下面的方法去处理这些分支：
1、先fork，得到：
	https://github/myself/project.git
2、把自己的分支clone到本地: 
	git clone https://github/myself/project.git
3、创建dev分支用于开发（不要在master上开发）：
	git checkout -b dev
	git push origin dev
4、创建upstream分支用于和remote分支同步：
	git checkout -b upstream
5、把upstream分支和remote关联起来：
	git checkout upstream
	git remote add upstream https://github/group/project.git
6、查看分支信息：
	git remote -v
	可以看到origin和myself的仓库关联，upstream和group的仓库关联：
	origin  https://github/myself/project (fetch)
	origin  https://github/myself/project (push)
	upstream  https://github/group/project (fetch)
	upstream  https://github/group/project (push)
7、先同步remote最新的代码：
	切换到dev分支：git branch dev
	更新信息：git remote update upstream
	把当前分支重新定位到remote的master分支（实际是合并多个commit）：git rebase upstream/master
	拉取最新的代码：git pull upstream master
8、在dev分支上修改代码，提交之后，push到自己的远程分支上：
	git push origin dev
9、把dev的代码合并到master分支上：
	git branch master
	git merge dev
10、push到远程分支：
	git push origin master
12、在myself的远程分支上：create merge request
结论：
（1）upstream只能用来获取remote分支的最新代码，我们不能直接通过它来提交代码；
（2）每次写代码之前都有保证dev分支的代码是最新的：git remote update upstream；
（3）修改完成之后，只能通过create merge request来向remote分支提交代码。
