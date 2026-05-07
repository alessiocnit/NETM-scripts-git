#!/bin/bash
# create docker network
sudo docker network create --driver=bridge --ip-range=172.18.0.0/24 --subnet=172.18.0.0/24 -o "com.docker.network.bridge.name=br0" netbr0

# start the ONOS controller docker attached to the docker network br0
sudo docker run -t -d --net=netbr0 --ip=172.18.0.2 --name onos onosproject/onos

# create a virtual link
sudo ip link add dev veth0 type veth peer name veth1
sudo ip link set veth0 up
sudo ip link set veth1 up

# add veth1 into the bridge br0
sudo ip link set veth1 master br0
