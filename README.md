# Usage
The `n2n` protocol options:

Name          | Type    | Required | Default | Description
--------------|---------|----------|---------|------------------------------------------------
server        | string  | yes      | (none)  | Supernode server
port          | int     | yes      | (none)  | Supernode port
community     | string  | yes      | (none)  | N2N community
key           | string  | no       | (none)  | The key of the community
mode          | string  | yes      | (none)  | For dhcp or static
ipaddr        | string  | yes      | (none)  | IPv4 Address of the interface
netmask       | string  | yes      | (none)  | Netmask of the interface
gateway       | string  | no       | (none)  | Gateway of the interface
ip6addr       | string  | no       | (none)  | IPv6 Address of the interface
ip6prefixlen  | int     | no       | (none)  | IPv6 Prefix Length of the interface
ip6gw         | string  | no       | (none)  | IPv6 Gateway of the interface
macaddr       | string  | no       | random  | MAC Address
mtu           | int     | no       | 1400    | Maximum Transmit Unit
forwarding    | boolean | no       | false   | Enable packet forwarding through n2n community
dynamic       | boolean | no       | false   | Periodically resolve supernode IP
