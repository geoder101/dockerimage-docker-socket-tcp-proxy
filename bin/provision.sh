#!/usr/bin/env bash

set -e

apt-get update
apt-get install -yq socat
apt-get clean
