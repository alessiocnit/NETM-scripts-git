#!/bin/sh

echo "--- Add gateways to namespaces..."
ip netns exec green ip route add default via 10.10.200.1
ip netns exec yellow ip route add default via 10.10.200.1
ip netns exec violet ip route add default via 10.10.100.1
ip netns exec cyan ip route add default via 10.10.100.1

