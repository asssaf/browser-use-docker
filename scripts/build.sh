#!/usr/bin/env bash

IMAGE="asssaf/browser-use"

docker build -t $IMAGE -f docker/Dockerfile .
