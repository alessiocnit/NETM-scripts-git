#!/bin/sh
echo
echo "--- ARP table in YELLOW namespace..."
ip netns exec yellow arp -n
sleep 5

echo
echo "--- PING from YELLOW to GREEN..."
ip netns exec yellow ping -c 5 10.10.10.2
sleep 10

echo
echo "--- ARP table in YELLOW namespace..."
ip netns exec yellow arp -n
sleep 5


