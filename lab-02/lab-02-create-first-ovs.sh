#!/bin/sh

echo "--- Create an OVS switch named lab2-br1..."

ovs-vsctl add-br lab2-br1

echo "--- Show OVS bridges"

ovs-vsctl show

echo "--- Activate the OVS switch named lab2-br1..."

ifconfig lab2-br1 up



