#!/bin/bash

set -e

pushd base
./update.sh
popd
pushd master
./update.sh
popd
pushd slave
./update.sh
popd
