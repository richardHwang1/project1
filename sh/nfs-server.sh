#!/bin/bash
mkdir /shared
chmod 777 /shared
echo "/shared 10.0.0.0/8(rw,sync)" > /etc/exports
systemctl restart nfs-server
systemctl enable nfs-server
ec2-metadata -o | cut -d ' ' -f 2 >> /nfs-shared/list.txt
chmod 777 /nfs-shared/list.txt
