# 2026-05-29 18:10:42 by RouterOS 7.22
# system id = 6nWiF+qTz/B
#
/interface ethernet
set [ find default-name=ether3 ] disable-running-check=no name=BACKUP
set [ find default-name=ether2 ] disable-running-check=no name="LAN CLIENT3"
set [ find default-name=ether1 ] disable-running-check=no name="LAN ROUTER3"
set [ find default-name=ether4 ] disable-running-check=no name=MANAGEMENT
/ip pool
add name=dhcp_pool0 ranges=192.168.1.2-192.168.1.254
/ip dhcp-server
add address-pool=dhcp_pool0 interface="LAN CLIENT3" name=dhcp1
/routing ospf instance
add disabled=no name=ROUTER3 router-id=4.4.4.4
/routing ospf area
add area-id=0.0.0.1 disabled=no instance=ROUTER3 name=AREA1
/ip address
add address=10.10.30.2/30 interface="LAN ROUTER3" network=10.10.30.0
add address=10.10.50.1/30 interface=BACKUP network=10.10.50.0
add address=192.168.1.1/24 interface="LAN CLIENT3" network=192.168.1.0
/ip dhcp-server network
add address=192.168.1.0/24 gateway=192.168.1.1
/ip dns
set allow-remote-requests=yes servers=8.8.8.8
/routing ospf interface-template
add area=AREA1 disabled=no interfaces="LAN ROUTER3"
add area=AREA1 disabled=no interfaces="LAN CLIENT3" passive
add area=*2 cost=100 disabled=yes interfaces=BACKUP
/system identity
set name=Router3
