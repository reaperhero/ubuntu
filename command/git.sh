# git



git checkout v1.17.14 # 切换到指定tag




# use http
git config --global url."https://guest:password@github.com/".insteadOf "https://github.com/" 
git remote set-url origin https://github.com/reaperhero/test.git


# 编辑全局配置
git config --global --edit 




# git代理
git config --global https.proxy http://127.0.0.1:1087
git config --global https.proxy https://127.0.0.1:1087


# 十分钟（600秒）传输速率都低于 1KB/s 的话才会 timeout
git config --global http.lowSpeedLimit 1000
git config --global http.lowSpeedTime 600