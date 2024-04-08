#!/bin/sh
echo "--- Deleting all namespaces configuration..."
ip -all netns delete
sleep 5

echo 
echo "--- Creating namespaces..."
ip netns add yellow
ip netns add green
sleep 1

echo 
echo "--- Creating links..."
ip link add veth-yellow type veth peer name veth-green
sleep 1

echo
echo "--- Moving interfaces into the namespaces"
ip link set veth-yellow netns yellow 
ip link set veth-green netns green 
sleep 1

echo
echo "--- Configuring IP addresses..."
ip -n yellow addr add 10.10.10.1/24 dev veth-yellow
ip -n green addr add 10.10.10.2/24 dev veth-green
sleep 1

echo
echo "--- Turning up the interfaces"
ip -n yellow link set veth-yellow up
ip -n green link set veth-green up
sleep 1

