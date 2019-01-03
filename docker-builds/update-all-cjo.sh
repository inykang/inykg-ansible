#!/bin/bash
cd alpine-s6-overlay && ./update.sh
cd ../alpine-s6-jdk8 && ./update.sh
cd ../zookeeper && ./update.sh
cd ../kafka && ./update.sh
cd ../hadoop && ./update-all.sh
cd ../ignite && ./update.sh
