#!/bin/sh
if [ -z "$1" ]
then 
  echo "No argument supplied, set registry to prireg:5000"
  REGISTRY="prireg:5000"
else
  echo "Set registry to $1"
  REGISTRY=$1
fi
NAME=kafka
TAG=2.12-0.11.0.2
echo "Working for ${REGISTRY}/${NAME}:${TAG}"
docker build -t ${REGISTRY}/${NAME}:${TAG} -f Dockerfile.${TAG} . \
  && docker push ${REGISTRY}/${NAME}:${TAG}
