#!/bin/sh







# Stop all pending rule expiry timers
killall sleep2 >& /dev/null

# Clear existing iptables rules from relevant chains
iptables --table nat --flush PREROUTING
iptables --table nat --flush POSTROUTING
/etc/init.d/ulogd stop >/dev/null



      # Appear to the outside with fixed addresses
	iptables --table nat -A POSTROUTING --jump MASQUERADE --out-interface eth1 #--source 192.0.0.0/24 #--destination 0/0
	#iptables --table nat -A POSTROUTING --jump MASQUERADE --out-interface eth1 --source 150.0.0.0/24 #--destination 0/0
	iptables --table nat --append PREROUTING --in-interface eth1 --destination 120.0.0.10  --jump DNAT --to-destination  10.0.0.2
