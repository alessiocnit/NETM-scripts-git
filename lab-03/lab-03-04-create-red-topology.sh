#!/bin/sh

# START from scratch

echo "--- Creating namespaces..."
ip netns add yellow
ip netns add green
ip netns add violet
ip netns add cyan
ip netns add red
sleep 1

echo "--- Create the OVS switch..."
ovs-vsctl add-br lab2-br1
sleep 1

echo "--- Activate the OVS switch..."
ifconfig lab2-br1 up
sleep 1

echo "--- Creating links..."
ip link add veth-yellow type veth peer name veth-yellow-br
ip link add veth-green type veth peer name veth-green-br
ip link add veth-violet type veth peer name veth-violet-br
ip link add veth-cyan type veth peer name veth-cyan-br
ip link add veth-red-100 type veth peer name veth-red-100-br
ip link add veth-red-200 type veth peer name veth-red-200-br
sleep 1

echo "--- Move interfaces in the switch..."
ovs-vsctl add-port lab2-br1 veth-yellow-br
ovs-vsctl add-port lab2-br1 veth-green-br
ovs-vsctl add-port lab2-br1 veth-violet-br
ovs-vsctl add-port lab2-br1 veth-cyan-br
ovs-vsctl add-port lab2-br1 veth-red-100-br
ovs-vsctl add-port lab2-br1 veth-red-200-br
sleep 1

echo "--- Move interfaces into namespaces..."
ip link set veth-yellow netns yellow
ip link set veth-green netns green
ip link set veth-violet netns violet
ip link set veth-cyan netns cyan
ip link set veth-red-100 netns red
ip link set veth-red-200 netns red
sleep 1

echo "Configuring IP addresses..."
ip -n yellow addr add 10.10.200.10/24 dev veth-yellow
ip -n green addr add 10.10.200.20/24 dev veth-green
ip -n violet addr add 10.10.100.30/24 dev veth-violet
ip -n cyan addr add 10.10.100.40/24 dev veth-cyan
ip -n red addr add 10.10.100.1/24 dev veth-red-100
ip -n red addr add 10.10.200.1/24 dev veth-red-200
sleep 1

echo "--- Set VLAN access ports..."
ovs-vsctl set port veth-yellow-br tag=200
ovs-vsctl set port veth-green-br tag=200
ovs-vsctl set port veth-cyan-br tag=100
ovs-vsctl set port veth-violet-br tag=100
ovs-vsctl set port veth-red-100-br tag=100
ovs-vsctl set port veth-red-200-br tag=200

echo "Turning up the interfaces within namespaces..."
ip -n yellow link set veth-yellow up
ip -n green link set veth-green up
ip -n violet link set veth-violet up
ip -n cyan link set veth-cyan up
ip -n red link set veth-red-100 up
ip -n red link set veth-red-200 up
sleep 1

echo "Turning up the interfaces within default namespace..."
sudo ip link set veth-yellow-br up
sudo ip link set veth-green-br up
sudo ip link set veth-violet-br up
sudo ip link set veth-cyan-br up
sudo ip link set veth-red-100-br up
sudo ip link set veth-red-200-br up

echo "--- OVS show..."
ovs-vsctl show


