#!/bin/sh

echo "--- Delete an OVS switch named lab2-br..."

ovs-vsctl del-br lab2-br1
ovs-vsctl del-br lab2-br2

echo "--- Show OVS bridges"

ovs-vsctl show





