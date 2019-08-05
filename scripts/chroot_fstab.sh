#!/bin/bash



source  /mnt/env.sh
[ -z "$INSTALL_KERNEL" ] && exit 1 || echo "Not empty.. continue"


chroot /mnt /bin/bash -ex <<EOF

cat > /etc/fstab << EOF_FSTAB
# <fs>       <mountpoint>    <type>    <opts>      <dump/pass>
${INSTALL_DEVICE}2    /              ext4   noatime   0 1
shm           /dev/shm       tmpfs  nodev,nosuid,noexec 0 0
EOF_FSTAB

EOF

