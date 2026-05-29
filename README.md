# MikroTik OSPF Multi-Area Routing Lab

## Overview

This project demonstrates the implementation of OSPF Multi-Area routing using MikroTik CHR routers and Ubuntu clients in a virtual lab environment.

The lab focuses on understanding OSPF fundamentals, Area Border Routers (ABR), route advertisement between areas, and network connectivity verification using Ping and Traceroute.

---

## Topology

![Topology](images/topology.png)

### OSPF Areas

| Area   | Description           |
| ------ | --------------------- |
| Area 0 | Backbone Area         |
| Area 1 | Client Network Area 1 |
| Area 2 | Client Network Area 2 |

---

## Network Architecture

### Backbone Area (Area 0)

* Core Router
* Router1 (ABR)
* Router2 (ABR)

### Area 1

* Router3
* Client Network: 192.168.1.0/24

### Area 2

* Router4
* Client Network: 192.168.3.0/24

---

## IP Addressing Plan

| Link              | Network       |
| ----------------- | ------------- |
| Core ↔ Router1    | 10.10.20.0/30 |
| Core ↔ Router2    | 10.10.10.0/30 |
| Router1 ↔ Router3 | 10.10.30.0/30 |
| Router2 ↔ Router4 | 10.10.40.0/30 |

---

## Features

* OSPF Multi-Area Routing
* Area Border Router (ABR)
* Dynamic Route Advertisement
* Inter-Area Communication
* Ubuntu Client Connectivity Testing
* Ping Verification
* Traceroute Analysis

---

## Testing Results

### Ping Test

![Ping Test](images/ping-test.png)

### Traceroute Test

![Traceroute Test](images/traceroute-test.png)

### OSPF Routes

![OSPF Routes](images/ospf-routes.png)

---

## Export Configurations

RouterOS export files are available in:

```text
exports/
```

Included configurations:

* core.rsc
* router1.rsc
* router2.rsc
* router3.rsc
* router4.rsc

---

## Technologies Used

* MikroTik CHR
* RouterOS v7
* OSPF
* Ubuntu Linux
* VirtualBox
* WinBox

---

## Learning Outcomes

Through this project I learned:

* OSPF neighbor formation
* Multi-Area OSPF design
* Area Border Router (ABR) implementation
* Route advertisement between OSPF areas
* Network troubleshooting
* Ping and Traceroute analysis
* Enterprise routing fundamentals

---

## Future Improvements

* OSPF Failover Testing
* OSPF Cost Manipulation
* Route Summarization
* VLAN Integration
* Physical MikroTik Deployment
