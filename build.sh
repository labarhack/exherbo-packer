#!/usr/bin/env bash

rm -rvf ./exherbo-kvm/
rm -rvf ./exherbo-vbox/
rm -rvf ./artefacts
# --only=virtualbox-iso
/opt/bin/packer build -parallel-builds=1 ./exherbo.json

sudo mv ./exherbo-kvm/* /var/lib/libvirt/images/ -vf 
sudo chown root:root /var/lib/libvirt/images/*


