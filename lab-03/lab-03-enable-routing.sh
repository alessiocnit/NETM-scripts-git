#!/bin/sh
echo "Enable routing in RED namespace..."
sudo ip netns exec red sysctl net.ipv4.ip_forward=1
