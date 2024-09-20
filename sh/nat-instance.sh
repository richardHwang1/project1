#!/bin/bash
echo "net.ipv4.ip_forward" >> /etc/sysctl.conf
sysctl -p /etc/sysctl.conf
yum install -y iptables-services
systemctl start iptables.service
systemctl enable iptables.service
iptables -F
iptables -t nat -A POSTROUTING -o eht0 -j MASQUERADE
service iptables save
