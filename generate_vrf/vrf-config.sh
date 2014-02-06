#!/bin/bash
#
# Created by: Brett Johnson
# Date      : FEB 2012
# Function  : Provide the config for a vrf and the relevant info
#             for bgp if their is no neighbour
#
# Start
#

echo -n "Name of the vrf : "
read -r  vrf_name

echo -n "AS Number : "
read -r as_value

echo -n "Route Distinguisher : "
read -r rd_value

echo -e "\n"
echo -e "ip vrf $vrf_name"
echo -e "rd $as_value:$rd_value"
echo -e "route-target import $rd_value"
echo -e "route-target export $rd_value"
echo -e "maximum routes 500 100"
echo -e "end\n"

echo -e "config t"
echo -e "router bgp $as_value"
echo -e "address-family ipv4 vrf $vrf_name"
echo -e "redistribute connected"
echo -e "redistribute static"
echo -e "no synchronization\n"

# End

