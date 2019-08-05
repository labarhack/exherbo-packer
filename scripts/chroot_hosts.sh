#!/usr/bin/env bash


source  /mnt/env.sh
[ -z "$INSTALL_KERNEL" ] && exit 1 || echo "Not empty.. continue"


chroot /mnt /bin/bash -ex <<EOF

source /env.sh

cat > /etc/hosts  << EOF_HOSTS
127.0.0.1    ${INSTALL_HOSTNAME}.example.com   ${INSTALL_HOSTNAME} localhost
::1          localhost
EOF_HOSTS

EOF

