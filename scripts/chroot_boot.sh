#!/usr/bin/env bash

#chroot /mnt /bin/bash -ex <<EOF


source  /mnt/env.sh
[ -z "$INSTALL_KERNEL" ] && exit 1 || echo "Not empty.. continue"

chroot /mnt /bin/bash -ex <<EOF

grub-install ${INSTALL_DEVICE}
grub-mkconfig -o /boot/grub/grub.cfg
cat /boot/grub/grub.cfg
blkid

EOF
