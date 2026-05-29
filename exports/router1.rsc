# 2026-05-29 17:44:12 by RouterOS 7.22
# system id = 8IDMyDTAU3L
#
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no name="LAN ROUTER1"
set [ find default-name=ether2 ] disable-running-check=no name="LAN ROUTER3"
set [ find default-name=ether3 ] disable-running-check=no name=MANAGEMENT
set [ find default-name=ether4 ] disable-running-check=no disabled=yes
/routing ospf instance
add disabled=no name=ROUTER1 router-id=2.2.2.2
/routing ospf area
add disabled=no instance=ROUTER1 name=AREA0
add area-id=0.0.0.1 disabled=no instance=ROUTER1 name=AREA1
/ip address
add address=10.10.20.2/30 interface="LAN ROUTER1" network=10.10.20.0
add address=10.10.30.1/30 interface="LAN ROUTER3" network=10.10.30.0
/routing ospf interface-template
add area=AREA0 disabled=no interfaces="LAN ROUTER1"
add area=AREA1 disabled=no interfaces="LAN ROUTER3"
/system identity
set name=Router1
