#!/bin/sh

echo "--- Add interface to the OVS..."

ovs-vsctl add-port lab2-br1 eth0

ovs-vsctl show
