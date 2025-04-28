from mininet.net import Mininet
from mininet.topo import Topo
from mininet.log import setLogLevel
from mininet.cli import CLI
from sys import argv

class ParametricTreeTopology(Topo):

    def __init__(self, num_racks=2, hosts_per_rack=4):
        Topo.__init__(self, n_racks=num_racks, hpr=hosts_per_rack)

    def build(self, n_racks, hpr):
        gateway = self.addSwitch(f's{racks+1}',failMode='standalone')
        for sw in range(racks):
            switch = self.addSwitch(f's{sw+1}',failMode='standalone')
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
    racks = 3
    hosts_per_switch = 5
    if len(argv) > 2:
        racks = int(argv[1])
        hosts_per_switch = int(argv[2])
    topo = ParametricTreeTopology(racks, hosts_per_switch)
    net = Mininet(topo, controller=None)
    net.start()
    CLI(net)
    net.stop()




