#!/bin/sh

echo "--- Set VLAN access ports..."

ovs-vsctl set port veth-green-br tag=200
ovs-vsctl set port veth-yellow-br tag=200
ovs-vsctl set port veth-cyan-br tag=100
ovs-vsctl set port veth-violet-br tag=100

echo "--- Set VLAN trunk port... VLAN 100 intentionally not included in trunk"
ovs-vsctl set port br2-trunk trunks=200,300
ovs-vsctl set port br1-trunk trunks=200,300

echo "--- Show OVS..."
ovs-vsctl show







