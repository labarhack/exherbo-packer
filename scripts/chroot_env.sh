#!/bin/bash

chroot /mnt /bin/bash -ex<<EOF
echo LANG="fr_FR.UTF-8" > /etc/env.d/99locale
localedef -i fr_FR -f UTF-8 fr_FR.UTF-8
source /etc/profile

cave sync

EOF
