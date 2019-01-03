#!/bin/sh
if [ -z "$1" ]
then 
  echo "No argument supplied, set registry to prireg:5000"
  REGISTRY="prireg:5000"
else
  echo "Set registry to $1"
  REGISTRY=$1
fi
NAME=logstash
TAG=2.4.0-1
echo "Working for ${REGISTRY}/${NAME}:${TAG}"
docker pull ${NAME}:${TAG} \
&& docker tag ${NAME}:${TAG} ${REGISTRY}/${NAME}:${TAG} \
&& docker push ${REGISTRY}/${NAME}:${TAG}
