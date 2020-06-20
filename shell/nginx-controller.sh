#!/bin/bash
export nginxs=`kubectl get po -n ingress-nginx|awk 'NR>2{ print $1}'`
export checkrul='/echo'
export sum=0

for controller in ${nginxs[@]};
do
    count=`kubectl logs ${controller} -n ingress-nginx|grep ${checkrul} |wc -l`
    sum=$((sum + $count))

    kubectl logs ${controller} -n ingress-nginx|grep ${checkrul} |awk '{print $(NF-1)}'|sort |uniq -c |sort -n|awk '{if ($1>20) print $0}'
    echo -e "${controller} ${count}"
done

echo ${sum}