# NMNET project iptables.sh version 1
# New CatIO network shell version1
# Wan
wan=

iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X
iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
# ACCEPT port
iptables -A INPUT  -p tcp -m multiport --dports 22,53,80,443,12450 -j ACCEPT
iptables -A INPUT  -p udp -m multiport --dports 22,53,80,443,12450 -j ACCEPT
# ACCEPT IO
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
# Log save 
iptables -A INPUT -i $wan -j LOG --log-prefix "iptables dropped packets:"
iptables -t nat -A POSTROUTING -o $wan -j MASQUERADE
