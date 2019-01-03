#!/bin/sh
TAG=obzen-reg:5000/obzen/influxdb:0.13.0
DIR=.
docker build -t ${TAG} ${DIR} && docker push ${TAG}
