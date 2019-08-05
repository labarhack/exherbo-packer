#!/usr/bin/env bash

chroot /mnt /bin/bash -ex<<EOF

rm /exherbo*
rm /env.sh
rm /sha1sum

EOF
