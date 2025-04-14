#!/bin/sh
echo "--- Deleting all namespaces..."
ip -all netns delete
sleep 1

