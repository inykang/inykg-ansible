docker run -it --rm \
  -e NAME_NODE_HOST=10.1.24.5 \
  -e NAME_NODE_FS_PORT=8020 \
  -p 50090 \
  -v $(pwd)/data:/data \
  prireg:5000/hadoop-secondary-name-node:2.7.3 su-exec hduser /bin/sh
