docker run -it --rm \
  -p 8020 \
  -p 50070 \
  -v $(pwd)/data:/data \
  prireg:5000/hadoop-name-node:2.7.3 su-exec hduser /bin/sh
