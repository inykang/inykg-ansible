#!/bin/sh
docker run -d --name gridgain-web-console -p 80:80 -v /data/prod/ignite:/var/lib/mongodb gridgain/gridgain-pro:2.3.2
