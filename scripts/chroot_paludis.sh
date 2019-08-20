#!/usr/bin/env bash

chroot /mnt /bin/bash -ex<<EOF

cave resolve repository/perl -x1
# cave resolve world -c

# On veux updater le monde
cave resolve world -c -km -Km -Cs   -x
cave resolve --execute --preserve-world --skip-phase test sys-apps/systemd

EOF
