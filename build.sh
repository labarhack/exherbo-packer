#!/usr/bin/env bash

rm -rvf ./exherbo-kvm/
rm -rvf ./exherbo-vbox/
rm -rvf ./artefacts
# --only=virtualbox-iso
/opt/bin/packer build --only=qemu -parallel-builds=1 ./exherbo.json





