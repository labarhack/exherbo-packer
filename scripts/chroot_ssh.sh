#!/bin/bash

chroot /mnt /bin/bash -ex<<EOF


systemctl enable sshd

EOF
