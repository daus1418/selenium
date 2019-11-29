#!/usr/bin/env bash

docker run --rm \
           -e USERNAME="onvacation" \
           --net=host \
           -v "$PWD/output":/output \
           -v "$PWD/suites":/suites \
           -v "$PWD/scripts":/scripts \
           -v "$PWD/reports":/reports \
           --security-opt seccomp:unconfined \
           --shm-size "1024M" \
           onvacation/docker
