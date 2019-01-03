docker run -it --rm \
  -e NAME_NODE_HOST=10.1.24.5 \
  -e NAME_NODE_FS_PORT=8020 \
  -p 8030 \
  -p 8031 \
  -p 8032 \
  -p 8033 \
  -p 8088 \
  -v $(pwd)/data:/data \
  prireg:5000/hadoop-resource-manager:2.7.3 su-exec hduser /bin/sh
