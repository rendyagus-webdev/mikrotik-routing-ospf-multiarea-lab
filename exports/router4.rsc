# 2026-05-29 18:11:26 by RouterOS 7.22
# system id = 3If2yIFHGcL
#
/interface ethernet
set [ find default-name=ether3 ] disable-running-check=no name=BACKUP
set [ find default-name=ether2 ] disable-running-check=no name="LAN CLIENT"
set [ find default-name=ether1 ] disable-running-check=no name="LAN ROUTER4"
set [ find default-name=ether4 ] disable-running-check=no name=MANAGEMENT
/ip pool
add name=dhcp_pool0 ranges=192.168.3.2-192.168.3.254
/ip dhcp-server
add address-pool=dhcp_pool0 interface="LAN CLIENT" name=dhcp1
/routing ospf instance
add disabled=no name=ROUTER4 router-id=5.5.5.5
/routing ospf area
add area-id=0.0.0.2 disabled=no instance=ROUTER4 name=AREA2
/ip address
add address=10.10.40.2/30 interface="LAN ROUTER4" network=10.10.40.0
add address=10.10.50.2/30 interface=BACKUP network=10.10.50.0
add address=192.168.3.1/24 interface="LAN CLIENT" network=192.168.3.0
/ip dhcp-server network
add address=192.168.3.0/24 gateway=192.168.3.1
/ip dns
set allow-remote-requests=yes servers=8.8.8.8
/routing ospf interface-template
add area=AREA2 disabled=no interfaces="LAN ROUTER4"
add area=AREA2 disabled=no interfaces="LAN CLIENT" passive
add area=*3 cost=100 disabled=yes interfaces=BACKUP
/system identity
set name=Router4
