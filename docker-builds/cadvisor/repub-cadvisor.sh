#!/bin/sh

TAG=obzen-reg:5000/obzen/cadvisor:0.22.0
DIR=.


set -e
set -x

docker build -t ${TAG} ${DIR} && docker push ${TAG}
