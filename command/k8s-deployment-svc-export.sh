#!/bin/bash
export PATH=$PATH


myundeployments=(`kubectl get deploy -n mlive|awk 'NR>1{print $1}'`)
for name in ${myundeployments[@]};
do
   kubectl get deploy $name -oyaml --export=true -n mlive > myun/deployment/${name}.yaml
   echo "${name} ....export"
done 

myunsvc=(`kubectl get svc -n mlive|awk 'NR>1{print $1}'`)
for name in ${myunsvc[@]};
do
   kubectl get svc $name -oyaml --export=true -n mlive > myun/deployment/${name}-svc.yaml
   echo "${name} ....export"
done 

bugudeployments=(`kubectl get deploy -n bugu|awk 'NR>1{print $1}'`)
for name in ${bugudeployments[@]};
do
   kubectl get deploy $name -oyaml --export=true -n bugu > bugu/deployment/${name}.yaml
   echo "${name} ....export"
done 
bugusvc=(`kubectl get svc -n bugu|awk 'NR>1{print $1}'`)
for name in ${deployments[@]};
do
   kubectl get svc $name -oyaml --export=true -n bugu > bugu/deployment/${name}-svc.yaml
   echo "${name} ....export"
done 
