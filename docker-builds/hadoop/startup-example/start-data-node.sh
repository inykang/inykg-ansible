docker run -it --rm \
  -e NAME_NODE_HOST=10.1.24.5 \
  -e NAME_NODE_FS_PORT=8020 \
  -e NAME_NODE_HTTP_PORT=50070 \
  -p 50010 \
  -p 50020 \
  -p 50075 \
  -v $(pwd)/data:/data \
  prireg:5000/hadoop-data-node:2.7.3 su-exec hduser /bin/sh
