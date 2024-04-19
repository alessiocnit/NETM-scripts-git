#!/bin/sh

# START from switched network configured in lab2 that used lab2-br1

echo "--- Create a second OVS switch named lab2-br2..."
ovs-vsctl add-br lab2-br2
sleep 1

ifconfig lab2-br2 up
sleep 1

echo "--- Move green and violet namespaces to switch lab2-br2..."
ovs-vsctl del-port lab2-br1 veth-violet-br
ovs-vsctl del-port lab2-br1 veth-green-br
ovs-vsctl add-port lab2-br2 veth-violet-br
ovs-vsctl add-port lab2-br2 veth-green-br
sleep 1

echo "--- Creating link between switches..."
ip link add br1-trunk type veth peer name br2-trunk
sleep 1

echo "--- Add trunk port to switches..."
ovs-vsctl add-port lab2-br1 br1-trunk
ovs-vsctl add-port lab2-br2 br2-trunk
sleep 1

echo "--- Turning up trunk interfaces..."
sudo ip link set lab2-br2 up
sudo ip link set br2-trunk up
sudo ip link set br1-trunk up
sleep 1

echo "--- OVS show..."
ovs-vsctl show

echo "--- TOPOLOGY as in figure, no vlan are configured..."

