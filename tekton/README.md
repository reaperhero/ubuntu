# pipeline


- Task: 构建任务, 可以定义一些列的 steps. 每个 step 由一个 container 执行.
- TaskRun: task 实际的执行, 并提供执行所需的参数. 这个对象创建后, 就会有 pod 被创建.
- Pipeline: 定义一个或者多个 task 的执行, 以及 PipelineResource 和各种定义参数的集合
- PipelineRun: 类似 task 和 taskrun 的关系: 一个定义一个执行. PipelineRun 则是 pipeline 的实际执行. 创建后也会创建 pod 来执行各个 task.


```
kubectl apply -f gcp-git-resource.yaml \
	gcp-git-secret.yaml \
	gcp-helm-git-resource.yaml \
	gcp-helm-task.yaml \
	gcp-image-resource.yaml \
	gcp-image-secret.yaml \
	gcp-kubectl-task.yaml \
	gcp-maven-kaniko-task.yaml \
	gcp-pipeline.yaml \
	gcp-unittest-task.yaml \
	serviceaccount.yaml
kubect create -f gcp-pipelinerun.yaml
```


```
> kubectl get pod -n tekton-pipelines
NAME                                                              READY   STATUS      RESTARTS   AGE
gcp-pipeline-run-1618836739877-gcp-helm-deploy-glrg2-pod-wrqbv    0/2     Completed   0          37m
gcp-pipeline-run-1618836739877-gcp-kubectl-deploy-wlplk-p-5twxq   0/1     Completed   0          39m
gcp-pipeline-run-1618836739877-gcp-maven-kaniko-build-2k8-ccgtf   0/5     Completed   0          39m
gcp-pipeline-run-1618836739877-gcp-maven-test-q7rbz-pod-2v5xq     0/2     Completed   0          39m
```