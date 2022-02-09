#!/bin/sh -l

k8sName=$1
k8sKind=$2
base64EncodedEnvString=$3

echo ${base64EncodedEnvString} | base64 -d > .env

result=$(python main.py --name ${k8sName} --kind ${k8sKind} --env .env)

echo "::set-output name=k8sObject::${result}"