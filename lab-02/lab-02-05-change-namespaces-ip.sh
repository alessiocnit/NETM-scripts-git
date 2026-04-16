#!/bin/sh

echo "--- Delete IP configuration of port enp0s3..."

ip netns exec yellow ifconfig veth-yellow 0
ip netns exec green ifconfig veth-green 0
ip netns exec cyan ifconfig veth-cyan 0
ip netns exec violet ifconfig veth-violet 0

echo "--- Assign an IP to the bridge in the proper subnet..."

ip netns exec yellow dhclient veth-yellow
ip netns exec green dhclient veth-green
ip netns exec cyan dhclient veth-cyan
ip netns exec violet dhclient veth-violet

echo "--- Show ifconfig on GREEN..."
ip netns exec green ifconfig

echo "--- Show the routing table on GREEN..."
ip netns exec green route -n








