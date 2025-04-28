from mininet.net import Mininet
from mininet.topo import Topo
from mininet.log import setLogLevel
from mininet.cli import CLI


class TreeTopology(Topo):

    def __init__(self):
        Topo.__init__(self)

    def build(self):

        s1 = self.addSwitch('s1', failMode='standalone')
        s2 = self.addSwitch('s2', failMode='standalone')
        h1 = self.addHost('h1')
        h2 = self.addHost('h2')
        h3 = self.addHost('h3')
        h4 = self.addHost('h4')
        h5 = self.addHost('h5')
        h6 = self.addHost('h6')
        h7 = self.addHost('h7')
        h8 = self.addHost('h8')
        external_host = self.addHost('h9')
        gateway = self.addSwitch('s3', failMode='standalone')

        self.addLink(s1, h1)
        self.addLink(s1, h2)
        self.addLink(s1, h3)
        self.addLink(s1, h4)

        self.addLink(s2, h5)
        self.addLink(s2, h6)
        self.addLink(s2, h7)
        self.addLink(s2, h8)

        self.addLink(s1, gateway)
        self.addLink(s2, gateway)

        self.addLink(gateway, external_host)



if __name__ == '__main__':
    setLogLevel('info')
    topology = TreeTopology()
    net = Mininet(topology, controller=None)
    net.start()
    CLI(net)
    net.stop()




