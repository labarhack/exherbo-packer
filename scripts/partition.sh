#!/usr/bin/env bash


if [ -e /dev/vda ]; then
 export INSTALL_DEVICE="/dev/vda"
elif [ -e /dev/sda ]; then
  export INSTALL_DEVICE="/dev/sda"
else
  echo "SET UP: targeted device ${INSTALL_DEVICE} is not found  " 
  echo "Not going further will halt now"
  exit 1
fi



parted "${INSTALL_DEVICE}" --script mklabel gpt

# GRUB
parted "${INSTALL_DEVICE}"  --script -- mkpart primary 0MB 2MB
parted "${INSTALL_DEVICE}"  --script -- name 1 bios_grub
parted "${INSTALL_DEVICE}"  --script -- set 1 bios_grub

# BOOT
#parted "${INSTALL_DEVICE}"  --script -- mkpart primary ext2 2MB 512MB
#parted "${INSTALL_DEVICE}"  --script -- name 2 boot
#parted "${INSTALL_DEVICE}"  --script -- set 2 boot on

# Create ext2
#mkfs.ext4 -L "slashboot" "${INSTALL_DEVICE}2"

parted "${INSTALL_DEVICE}" --script mkpart primary ext4 2MB 100%
parted "${INSTALL_DEVICE}"  --script -- name 2 boot
parted "${INSTALL_DEVICE}"  --script -- set 2 boot on

mkfs.ext4 -L "rootfs" "${INSTALL_DEVICE}2"
parted "${INSTALL_DEVICE}" --script -- print


mount --verbose "${INSTALL_DEVICE}2" /mnt

mkdir /mnt/etc

cat  <<< " 
export INSTALL_DEVICE=\"${INSTALL_DEVICE}\"    
export INSTALL_KERNEL=\"${PACKER_KERNEL}\"
export INSTALL_HOSTNAME=\"${PACKER_HOSTNAME}\"
export INSTALL_DOCKER=\"${PACKER_WITH_DOCKER}\"
export INSTALL_JAVA=\"${PACKER_WITH_JAVA}\"
"> /mnt/env.sh

cat /mnt/env.sh

#cat <<EOF > /mnt/etc/fstab
## <fs>       <mountpoint>    <type>    <opts>      <dump/pass>
#/dev/vda2    /           ext4 defaults    0 0
#EOF

