#!/bin/sh
docker run -d --restart=always --name prireg -p 5000:5000 -v /data/prireg:/var/lib/registry registry:2
