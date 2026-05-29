# 2026-05-29 18:09:49 by RouterOS 7.22
# system id = kHkInORuasE
#
/interface ethernet
set [ find default-name=ether1 ] disable-running-check=no name="LAN ROUTER2"
set [ find default-name=ether2 ] disable-running-check=no name="LAN ROUTER4"
set [ find default-name=ether3 ] disable-running-check=no name=MANAGEMENT
set [ find default-name=ether4 ] disable-running-check=no disabled=yes
/routing ospf instance
add disabled=no name=ROUTER2 router-id=3.3.3.3
/routing ospf area
add disabled=no instance=ROUTER2 name=AREA0
add area-id=0.0.0.2 disabled=no instance=ROUTER2 name=AREA2
/ip address
add address=10.10.10.2/30 interface="LAN ROUTER2" network=10.10.10.0
add address=10.10.40.1/30 interface="LAN ROUTER4" network=10.10.40.0
/routing ospf interface-template
add area=AREA0 disabled=no interfaces="LAN ROUTER2"
add area=AREA2 disabled=no interfaces="LAN ROUTER4"
/system identity
set name=Router2
