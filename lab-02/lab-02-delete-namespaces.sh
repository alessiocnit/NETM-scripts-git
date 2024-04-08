#!/bin/sh
echo "--- Deleting all namespaces..."
ip -all netns delete
sleep 1

echo "--- Deleting trunk interfaces..."
ip link delete br2-trunk
sleep 1

