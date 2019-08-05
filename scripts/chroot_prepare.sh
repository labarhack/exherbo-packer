#!/bin/bash

mount -o rbind /dev /mnt/dev/
mount -o bind /sys /mnt/sys/
mount -t proc none /mnt/proc/

cat <<EOF > /mnt/etc/paludis/options.conf
*/* build_options: jobs=7 symbols=strip -recommended_tests
*/* targets: x86_64-pc-linux-gnu
*/* dbus man-pages xattr

EOF
