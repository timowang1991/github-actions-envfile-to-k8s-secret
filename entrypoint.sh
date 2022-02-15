#!/bin/sh -l

k8sName=$1
k8sNamespace=$2
base64EncodedEnvString=$3

echo ${base64EncodedEnvString} | base64 -d > /tmp/.env

result=$(python /opt/main.py --name ${k8sName} --namespace ${k8sNamespace} --env /tmp/.env)

result="${result//'%'/'%25'}"
result="${result//$'\n'/'%0A'}"
result="${result//$'\r'/'%0D'}"

echo "::set-output name=k8sObject::${result}"