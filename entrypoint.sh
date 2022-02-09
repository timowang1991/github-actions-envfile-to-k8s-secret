#!/bin/sh
name=$1
base64EncodedEnvString=$2
k8sKind=$3

base64DecodedEnvString=$(echo ${base64EncodedEnvString} | base64 -d)

result=$(echo ${base64DecodedEnvString} | python main.py --name ${name} --kind ${k8sKind})
echo "::set-output name=k8sOutputObject::${result}"