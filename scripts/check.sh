#!/bin/bash

echo "SET UP: choosed kernel $PACKER_KERNEL"
echo "SET UP: hostname: $PACKER_HOSTNAME"


if [ -e /dev/vda ]; then
 export DEVICE="/dev/vda"
elif [ -e /dev/sda ]; then
  export DEVICE="/dev/sda"
else
  echo "SET UP: targeted device ${DEVICE} is not found  " 
  echo "Not going further will halt now"
  exit 1
fi

echo "SET UP: will perform install to ${DEVICE}"

[ -d /sys/firmware/efi ] && echo "SET UP: Session EFI" || echo "SET UP: Session non EFI"

ls /root -la

sleep 10



























