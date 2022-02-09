#!/bin/sh
k8sName=$1
k8sKind=$2
base64EncodedEnvString=$3

base64DecodedEnvString=$(echo ${base64EncodedEnvString} | base64 -d)

result=$(echo ${base64DecodedEnvString} | python main.py --name ${k8sName} --kind ${k8sKind})
echo "::set-output name=k8sOutputObject::${result}"