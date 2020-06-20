# vegeta 压测


- 单个接口

```
echo "GET http://192.168.179.15:5000/index.html"| vegeta attack -rate=50000 -connections=100 -duration=10s | tee results.bin | vegeta report
```
- 指定文件

```
vegeta attack -targets="target.txt" -rate=10 -duration=2s | tee results.bin | vegeta report
```
