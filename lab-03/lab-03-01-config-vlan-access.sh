#!/bin/sh

echo "--- Set VLAN access ports..."

ovs-vsctl set port veth-green-br tag=200
ovs-vsctl set port veth-yellow-br tag=200
ovs-vsctl set port veth-cyan-br tag=100
ovs-vsctl set port veth-violet-br tag=100

echo "--- Show OVS switch configuration with VLANs..."
sudo ovs-vsctl show




