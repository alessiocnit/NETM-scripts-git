# Create the switch
sudo ovs-vsctl add-br switch1

# Set OpenFlow 1.3
sudo ovs-vsctl set bridge switch1 protocols=OpenFlow13

# Set the controller address
sudo ovs-vsctl set-controller switch1 tcp:172.17.0.2:6653

# Set the fail-mode (select one)
#sudo ovs-vsctl set-fail-mode switch1 secure
sudo ovs-vsctl set-fail-mode switch1 standalone

# (opzionale) porta su il bridge
sudo ip link set switch1 up
