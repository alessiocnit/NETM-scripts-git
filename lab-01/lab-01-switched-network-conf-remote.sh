#!/bin/sh

echo "Deleting previous configuration..."
ip addr del 10.10.10.100/24 dev v-net-0

ip netns exec green ip route del default via 10.10.10.100
ip netns exec yellow ip route del default via 10.10.10.100
ip netns exec violet ip route del default via 10.10.10.100
ip netns exec cyan ip route del default via 10.10.10.100

sudo sysctl net.ipv4.ip_forward=0

iptables -t nat -A POSTROUTING -s 10.10.10.0/24 -j MASQUERADE

#Try ping from host to green - not working
#Solution
echo "Assign an IP to the bridge..."
ip addr add 10.10.10.100/24 dev v-net-0
sleep 1

#Try to ping from green to internet 8.8.8.8 - not working "Network is unreachable"
echo "Configure a gateway in each namespace..."
ip netns exec green ip route add default via 10.10.10.100
ip netns exec yellow ip route add default via 10.10.10.100
ip netns exec violet ip route add default via 10.10.10.100
ip netns exec cyan ip route add default via 10.10.10.100

#If capture packets reach v-net-0 but do not reach enps03

#Enable IP forwarding
sudo sysctl net.ipv4.ip_forward=1

#Try to ping - not working
#If capture packets reach v-net-0, enps03, are sent to internet
#--- Private source address !!!

#Try to ping from green internet 8.8.8.8 - no reply
iptables -t nat -A POSTROUTING -s 10.10.10.0/24 -j MASQUERADE

