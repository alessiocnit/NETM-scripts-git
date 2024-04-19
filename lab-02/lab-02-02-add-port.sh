#!/bin/sh

echo "--- Add interface to the OVS..."

ovs-vsctl add-port lab2-br1 enp0s3

ovs-vsctl show
