#!/bin/bash

apt-get update -y
mkdir -p /usr/local/docker/web
wget -qO- https://get.docker.com/ | sh


