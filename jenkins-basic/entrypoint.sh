#!/bin/bash

dockerd \
    --host=unix:///var/run/docker.sock \
    --host=tcp://0.0.0.0:2375 \
    --insecure-registry=${REGISTRY_IP:-127.0.0.1}:5000 \
    --storage-driver=vfs &

exec /bin/tini -- \
    /usr/local/bin/jenkins.sh \
    --httpPort=8000

