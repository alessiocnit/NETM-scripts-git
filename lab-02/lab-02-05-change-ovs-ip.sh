#!/bin/sh

echo "--- Delete IP configuration of port enp0s3..."

ifconfig lab2-br1 0

echo "--- Assign an IP to the bridge in the proper subnet..."

sudo ip addr add 10.10.10.100/24 dev lab2-br1

echo "--- Show the routing table..."
route -n








