#!/bin/sh
set -e -u

# Create build output folder if necessary:
mkdir -p ./termux

IMAGE_NAME=termux/package-builder

echo "Running container from image '$IMAGE_NAME'..."

docker run \
  --dns 4.2.2.1 \
	-v $PWD:/root/termux-packages \
	-v $PWD/termux:/root/termux \
	-ti $IMAGE_NAME bash

