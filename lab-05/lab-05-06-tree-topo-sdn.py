from mininet.net import Mininet
from mininet.topo import Topo
from mininet.log import setLogLevel
from mininet.cli import CLI
from mininet.node import RemoteController

import sys
from sys import argv

class ParametricTreeTopology(Topo):

    def __init__(self, num_racks=2, hosts_per_rack=4):
        Topo.__init__(self, n_racks=num_racks, hpr=hosts_per_rack)

    def build(self, n_racks, hpr):
        print(f"Build parameeters --- Number of racks: {n_racks}, number of hosts: {hpr}")

        gateway = self.addSwitch(f's{racks+1}')
        for sw in range(racks):
            switch = self.addSwitch(f's{sw+1}')
            self.addLink(gateway, switch)
            for ht in range(hpr):
                host_index = hpr*sw + ht + 1
                host = self.addHost(f'h{host_index}')
                self.addLink(switch, host)
        external_host_index = hpr*racks + 1
        external_host = self.addHost(f"h{external_host_index}")
        self.addLink(gateway, external_host)


if __name__ == '__main__':
    setLogLevel('info')
    
    #Default values
    racks = 2
    hosts_per_switch = 4

    #Loading CLI arguments
    if len(argv) == 1: 
        print(f"Assuming default topology")
    else:
        if len(argv) > 2:
            racks = int(argv[1])
            hosts_per_switch = int(argv[2])
        else:
            print(f"Inconsistent number of input arguments")
            sys.exit()

    print(f"Input parameeters --- Number of racks: {racks}, number of hosts: {hosts_per_switch}")
    
    #Initialization of Mininet topology
    topo = ParametricTreeTopology(racks, hosts_per_switch)
    cont = RemoteController('c', '172.17.0.2')
    
    #Creation of Mininet topology
    net = Mininet(topo,controller=None)
    net.addController(cont)

    #Execution of Mininet topology
    net.start()
    CLI(net)
    net.stop()

