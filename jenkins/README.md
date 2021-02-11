# jenkins

## 插件列表

```
Chinese(Simplified)
Role-based Authorization Strategy   # 用户权限
Git
GitlabHook
GitLab 
Credentials Binding                 # 凭证管理
    可以添加的凭证有5种：
        Usernamewithpassword：用户名和密码
        SSHUsernamewithprivatekey：使用SSH用户和密钥
        Secretﬁle：需要保密的文本文件，使用时Jenkins会将文件复制到一个临时目录中，再将文件路径设置到一个变量中，等构建结束后，所复制的Secretﬁle就会被删除。
        Secrettext：需要保存的一个加密的文本串，如钉钉机器人或Github的apitoken 
        Certiﬁcate：通过上传证书文件的方式

Deploy to container               # 部署到tomcat
Maven Integration                 # maven插件
pipeline                          # 流水线插件
Email Extension Template          # 邮件插件
Publish Over SSH                  # 远程cmd插件
NodeJS                            # 前端
```