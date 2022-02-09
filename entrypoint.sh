#!/bin/sh
k8sName=$1
k8sKind=$2
base64EncodedEnvString=$3

base64DecodedEnvString=$(echo ${base64EncodedEnvString} | base64 -d)

echo "1:$1"
echo "2:$2"
echo "3:$3"

echo "k8sName:$k8sName"
echo "k8sKind:$k8sKind"
echo "base64EncodedEnvString:$base64EncodedEnvString"
echo "base64DecodedEnvString:$base64DecodedEnvString"

result=$(echo ${base64DecodedEnvString} | python main.py --name ${k8sName} --kind ${k8sKind})
echo "::set-output name=k8sOutputObject::${result}"