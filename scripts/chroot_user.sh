#!/bin/bash

chroot /mnt /bin/bash -ex<<EOF

ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime
sed -i /etc/vconsole.conf -e 's/KEYMAP="us"/KEYMAP="fr"/g'

echo "lapin
lapin
" | passwd

useradd -m -G adm,disk,wheel,cdrom,audio,video,usb,users tux

echo "lapin
lapin
" | passwd tux

useradd -m -G adm,disk,wheel,cdrom,audio,video,usb,users vagrant
echo "vagrant
vagrant
" | passwd vagrant

echo "vagrant ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/vagrant




EOF


