#!/bin/sh
echo
echo "--- PING from YELLOW to GREEN..."
ip netns exec yellow ping -c 3 10.10.10.2
sleep 2

echo
echo "--- PING from CYAN to VIOLET..."
ip netns exec cyan ping -c 3 10.10.10.3
sleep 2

echo
echo "--- PING from VIOLET to YELLOW..."
ip netns exec violet ping -c 3 10.10.10.1
sleep 2

echo
echo "--- PING from HOST to YELLOW... not working"
ping -c 3 10.10.10.1
sleep 2


