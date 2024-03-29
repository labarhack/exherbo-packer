#!/usr/bin/env bash

source  /mnt/env.sh
[ -z "$INSTALL_KERNEL" ] && exit 1 || echo "Not empty.. continue"

chroot /mnt /bin/bash -ex <<EOF


[ -z "$INSTALL_KERNEL" ] && exit 1 || echo "Not empty.. continue"

#cave resolve -z -1 repository/danyspin97 -x 
#cave resolve --skip-phase test sys-kernel/genkernel-next -x
cave resolve dracut -x

git clone https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git --depth 1 -b v${INSTALL_KERNEL} /usr/src/linux
cd /usr/src/linux

make x86_64_defconfig
make kvmconfig

make -j7
make -j7 modules
make install
make modules_install 

dracut --verbose '' ${INSTALL_KERNEL}
EOF

