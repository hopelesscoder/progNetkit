#!/bin/sh







# Stop all pending rule expiry timers
killall sleep2 >& /dev/null

# Clear existing iptables rules from relevant chains
iptables --table nat --flush PREROUTING
iptables --table nat --flush POSTROUTING
/etc/init.d/ulogd stop >/dev/null



      # Appear to the outside with fixed addresses
	iptables --table nat -A POSTROUTING --jump MASQUERADE --out-interface eth1 --source 172.0.0.0/24 #--destination 0/0
	# web-usa si raggiunge all'indirizzo 100.0.0.10
	iptables --table nat --append PREROUTING --in-interface eth1 --destination 100.0.0.10  --jump DNAT --to-destination  172.0.0.1
	# web-usa2 si raggiunge all'indirizzo 100.0.0.11	
	iptables --table nat --append PREROUTING --in-interface eth1 --destination 100.0.0.11  --jump DNAT --to-destination  172.0.0.25
	# dnsusa si raggiunge all'indirizzo 100.0.0.12	
	iptables --table nat --append PREROUTING --in-interface eth1 --destination 100.0.0.12  --jump DNAT --to-destination  172.0.0.6

