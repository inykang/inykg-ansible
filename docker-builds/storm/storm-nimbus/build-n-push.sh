#!/bin/sh
docker build -t obzen-reg:5000/obzen/storm-nimbus:0.10.0 . && docker push obzen-reg:5000/obzen/storm-nimbus:0.10.0
