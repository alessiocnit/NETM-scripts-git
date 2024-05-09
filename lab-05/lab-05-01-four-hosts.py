from mininet.net import Mininet
from mininet.topo import Topo
from mininet.log import setLogLevel
from mininet.cli import CLI


class SimpleTopology(Topo):
    def __init__(self, num_hosts=2):
        Topo.__init__(self, num_hosts)

    def build(self, num_hosts):
        switch = self.addSwitch('s1')
        for host in range(num_hosts):
            hostname = 'h' + str(host + 1)
            node = self.addNode(hostname)
            self.addLink(switch, node)


if __name__ == '__main__':
    setLogLevel('info')
    topology = SimpleTopology(4)
    net = Mininet(topology)
    net.start()
    CLI(net)
    net.stop()



