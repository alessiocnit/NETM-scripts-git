#!/bin/sh

echo "--- Delete an OVS switch named lab2-br..."
ovs-vsctl del-br lab2-br1
ovs-vsctl del-br lab2-br2

echo "--- Show OVS bridges"
ovs-vsctl show

echo "--- Deleting virtual interfaces..."
ip link del veth-yellow-br
ip link del veth-green-br
ip link del veth-cyan-br
ip link del veth-violet-br

echo "--- Resetting eth0 configuration..."
ifconfig eth0 0
dhclient eth0

echo "--- Deleting all namespaces..."
ip -all netns delete

echo "--- Show interfaces..."
ifconfig

