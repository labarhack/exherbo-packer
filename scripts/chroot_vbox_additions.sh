#!/bin/bash

source /mnt/env.sh

mkdir /mnt/tmp/isomount
mount -t iso9660 -o loop /root/VBoxGuestAdditions.iso /mnt/tmp/isomount


chroot /mnt /bin/bash -ex<<EOF

# /tmp/isomount/VBoxLinuxAdditions.run

EOF

#umount isomount
#rm -rf isomount /root/VBoxGuestAdditions.iso
