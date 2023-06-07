# pipeline


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