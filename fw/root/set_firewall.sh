#!/bin/sh


# Stop all pending rule expiry timers
killall sleep2 >& /dev/null

# Clear existing iptables rules from relevant chains
iptables --table nat --flush PREROUTING
iptables --table nat --flush POSTROUTING
/etc/init.d/ulogd stop >/dev/null



      # Drop ssh to web-it
	iptables -A FORWARD --in-interface eth1 -p tcp --dport 22 -j DROP
