#!/usr/bin/env bash

socat \
    -d -d -lmlocal2 \
    tcp-listen:8000,reuseaddr,fork \
    unix:/var/run/docker.sock
