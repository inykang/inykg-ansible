#!/bin/bash

set -e

pushd base
./update.sh
popd
pushd name-node
./update.sh
popd
pushd secondary-name-node
./update.sh
popd
pushd data-node
./update.sh
popd
pushd resource-manager
./update.sh
popd
pushd node-manager
./update.sh
popd
pushd job-history-server
./update.sh
popd
pushd yarn-timeline-server
./update.sh
popd
