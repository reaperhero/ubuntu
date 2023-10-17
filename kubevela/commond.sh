

vela up -f vela.yaml  // 创建应用
vela status webservice-app // 获取应用的部署状态
vela delete webservice-app 
vela status webservice-app --tree --detail

vela workflow resume webservice-app  // 人工审核

vela def list  -n default             // 查看模块定义列表
vela show redis                       // 查看模块定义 
