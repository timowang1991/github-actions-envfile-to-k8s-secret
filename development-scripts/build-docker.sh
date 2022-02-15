set -e

docker buildx build --tag timowang1991/github-actions-envfile-to-k8s-secret --platform=linux/amd64 .
docker push timowang1991/github-actions-envfile-to-k8s-secret