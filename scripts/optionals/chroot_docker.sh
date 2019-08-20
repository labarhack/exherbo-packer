#!/bin/bash

if [ $INSTALL_DOCKER="true" ]
then

  source /mnt/env.sh

  cp /tmp/patch_config /mnt/tmp/patch_config -vf
  cat /mnt/tmp/patch_config

  chroot /mnt /bin/bash -ex<<EOF

# /!\ il faut recompiler pour activer CONFIG_DM_THIN_PROVISIONING,CGROUP, BRIDGE ... necessaire pour docker /!\
# pour cette image c'est pas des modules !!!


echo "** Patching kernel for docker support"
cat /tmp/patch_config

patch /usr/src/linux/.config < /tmp/patch_config
cd /usr/src/linux
make -j7
make -j7 modules
make -j7 modules_install
make install



cave resolve -x   repository/virtualization
cave resolve -x   repository/CleverCloud
cave resolve -x   repository/net
cave resolve -x   net-misc/bridge-utils

cave resolve -x   app-virtualization/moby

EOF
fi

