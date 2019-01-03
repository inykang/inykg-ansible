#!/bin/sh
TAG=obzen-reg:5000/obzen/storm-supervisor:0.10.0
docker build -t ${TAG} . && docker push ${TAG}
