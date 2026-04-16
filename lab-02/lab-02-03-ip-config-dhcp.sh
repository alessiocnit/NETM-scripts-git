#!/bin/sh

echo "--- Delete IP configuration of port enp0s3..."

ifconfig eth0 0

echo "--- Assign an IP to the bridge using DHCP local..."

dhclient lab2-br1

echo "--- Show the routing table..."
route -n








