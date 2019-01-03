docker run -it --rm \
  -e NAME_NODE_HOST=10.1.24.5 \
  -e NAME_NODE_FS_PORT=8020 \
  -v $(pwd)/data:/data \
  -p 10020 \
  -p 19888 \
  -p 10033 \
  prireg:5000/hadoop-history-server:2.7.3 su-exec hduser /bin/sh
  #-e RESOURCE_MANAGER_HOST=10.1.24.7 \
  #-e RESOURCE_MANAGER_PORT=8032 \
  #-e RESOURCE_MANAGER_RESOURCE_TRACKER_PORT=8031 \
  #-e RESOURCE_MANAGER_SCHEDULER_PORT=8030 \
