# Usage
The `n2n` protocol options:

Name          | Type    | Required | Default | Description
--------------|---------|----------|---------|------------------------------------------------
server        | string  | yes      | (none)  | Supernode server
port          | int     | yes      | (none)  | Supernode port
server2       | string  | no       | (none)  | Supernode server of slave
port2         | int     | no       | (none)  | Supernode port of slave
community     | string  | yes      | (none)  | N2N community
key           | string  | no       | (none)  | The key of the community
mode          | string  | yes      | (none)  | For dhcp or static
ipaddr        | string  | no       | (none)  | IPv4 Address of the interface
netmask       | string  | no       | (none)  | Netmask of the interface
gateway       | string  | no       | (none)  | Gateway of the interface
ip6addr       | string  | no       | (none)  | IPv6 Address of the interface
ip6prefixlen  | int     | no       | (none)  | IPv6 Prefix Length of the interface
ip6gw         | string  | no       | (none)  | IPv6 Gateway of the interface
macaddr       | string  | no       | random  | MAC Address
mtu           | int     | no       | 1400    | Maximum Transmit Unit
forwarding    | boolean | no       | false   | Enable packet forwarding through n2n community
dynamic       | boolean | no       | false   | Periodically resolve supernode IP
localport     | int     | no       | random  | Fixed local UDP port
mgmtport      | int     | no       | (none)  | Management UDP Port (for multiple edges on a machine)
multicast     | boolean | no       | false   | Accept multicast MAC addresses
verbose       | boolean | no       | false   | Make more verbose