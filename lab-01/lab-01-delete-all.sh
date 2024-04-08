#!/bin/sh
echo "--- Deleting bridge v-net-0..."
ip addr del 10.10.10.100/24 dev v-net-0
sleep 1

echo "--- Disable routing..."
sudo sysctl net.ipv4.ip_forward=0
sleep 1

echo "--- Disable NAT..."
iptables -t nat -A POSTROUTING -s 10.10.10.0/24 -j MASQUERADE
sleep 1

echo "--- Deleting all namespaces..."
ip -all netns delete
sleep 1

echo "--- Deleting virtual switch v-net-o..." 
ip link del v-net-0
sleep 1
