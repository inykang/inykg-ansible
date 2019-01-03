docker run -it --rm \
  -e NAME_NODE_HOST=10.1.24.5 \
  -e NAME_NODE_FS_PORT=8020 \
  -e RESOURCE_MANAGER_HOST=10.1.24.7 \
  -e RESOURCE_MANAGER_PORT=8032 \
  -e RESOURCE_MANAGER_RESOURCE_TRACKER_PORT=8031 \
  -e RESOURCE_MANAGER_SCHEDULER_PORT=8030 \
  -p 8040 \
  -p 8042 \
  -v $(pwd)/data:/data \
  prireg:5000/hadoop-node-manager:2.7.3 su-exec hduser /bin/sh
