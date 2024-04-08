#!/bin/sh
echo "--- Deleting all namespaces configuration..."
ip -all netns delete
sleep 5

