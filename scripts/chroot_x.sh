#!/bin/bash

chroot /mnt /bin/bash -ex<<EOF

cave resolve -x repository/x11
cave resolve -x repository/media
cave resolve -x repository/desktop

cave resolve -x repository/ferdy
cave resolve -x repository/python
cave resolve -x repository/tanderson


cave resolve -x xorg-server 
cave resolve -x  libdrm
cave resolve -x  xf86-video-vesa

# ????
cave resolve -x x11-apps/xclock
cave resolve -x x11-apps/xmodmap
cave resolve -x x11-apps/xrdb
cave resolve -x x11-apps/xterm
cave resolve -x x11-wm/twm
cave resolve -x x11-apps/xinput


cave resolve -x  xinit
cave resolve -x  x11-wm/i3


EOF


