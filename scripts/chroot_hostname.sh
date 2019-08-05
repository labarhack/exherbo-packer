#!/usr/bin/env bash

source  /mnt/env.sh
[ -z "$INSTALL_KERNEL" ] && exit 1 || echo "Not empty.. continue"

chroot /mnt /bin/bash -ex <<EOF

echo "${INSTALL_HOSTNAME}" > /etc/hostname

EOF

