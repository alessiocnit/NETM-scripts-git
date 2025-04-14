#!/bin/sh
echo "Enable routing in RED namespace..."
sudo ip netns exec red sysctl net.ipv4.ip_forward=1

echo "Routing table in RED namespace"
sudo ip netns exec red route -n

