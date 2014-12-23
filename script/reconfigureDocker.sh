#!/bin/bash
# author chenxingyu

ip link set dev docker0 down
brctl delbr docker0

source /run/flannel/subnet.env

echo DOCKER_OPTS=\"--insecure-registry 10.10.103.215:5000 -H tcp://127.0.0.1:4243 -H unix:///var/run/docker.sock \
    --bip=${FLANNEL_SUBNET} --mtu=${FLANNEL_MTU}\" > /etc/default/docker

service docker restart