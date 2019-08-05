#!/usr/bin/env bash

chroot /mnt /bin/bash -ex<<EOF

systemctl enable dhcpcd

EOF
