#!/bin/bash

source /mnt/env.sh

echo "SET UP: choosed kernel $INSTALL_KERNEL"
echo "SET UP: hostname: $INSTALL_HOSTNAME"
echo "SET UP: will perform install to ${INSTALL_DEVICE}"

[ -d /sys/firmware/efi ] && echo "SET UP: Session EFI" || echo "SET UP: Session non EFI"





























