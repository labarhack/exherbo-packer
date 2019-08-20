#!/bin/bash

if [ "$INSTALL_JAVA" = "true" ]
then
chroot /mnt /bin/bash -ex<<EOF

cave resolve -x repository/desktop
cave resolve -x repository/media
cave resolve -x repository/java 
#cave resolve -x repository/x11

cave sync

echo "*/* ca-trust" >> /etc/paludis/options.conf
echo "app-text/poppler  lcms" >> /etc/paludis/options.conf
cave resolve -x  dev-lang/openjdk-bin
cave resolve -x  dev-lang/openjdk12
cave resolve -x  dev-java/gradle
cave resolve -x  dev-java/maven

EOF
fi

