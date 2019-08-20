#!/usr/bin/env bash

sudo cp ./exherbo-kvm/* /var/lib/libvirt/images/ -vf 
sudo chown root:root /var/lib/libvirt/images/*
# virt-install -n ns -r 8192 -disk /var/lib/libvirt/images/vm1.cqow2 -import
sudo virt-install \
  -n Exherbo \
  --ram 8192 \
  --os-type linux \
  --os-variant generic \
  --graphics none \
  --network network=default \
  --disk /var/lib/libvirt/images/exherbo.qcow2 \
  --import 
#
