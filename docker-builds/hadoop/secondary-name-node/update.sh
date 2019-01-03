#!/bin/sh
if [ -z "$1" ]
then 
  echo "No argument supplied, set registry to prireg:5000"
    REGISTRY="prireg:5000"
  else
    echo "Set registry to $1"
    REGISTRY=$1
fi
NAME=hadoop-secondary-name-node
TAG=2.7.4
docker build -t ${REGISTRY}/${NAME}:${TAG} -f Dockerfile.${TAG} . \
  && docker push ${REGISTRY}/${NAME}:${TAG}

