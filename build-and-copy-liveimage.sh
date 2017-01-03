#!/bin/bash
# Wrapper around livecd-creator / livecd-iso-to-pxe
# Generate a livecd 
# Generate pxe image 
# Copy initrd and image into /var/lib/tftpboot/livecd/
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR/build
if [ -d /var/lib/tftpboot/livecd]:
	rm -Rf /var/lib/tftpboot/livecd
fi
rm -Rf tftpboot

livecd-creator -c kickstart/centos-7-live-base.ks --releasever=7 -f centos7-livecd
mv 