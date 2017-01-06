#!/bin/bash
# Wrapper around livecd-creator / livecd-iso-to-pxe
# Generate a livecd 
# Generate pxe image 
# Copy initrd and image into /var/lib/tftpboot/livecd/
PXEDIR="/var/lib/tftpboot"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
if [ ! -d "$DIR/build" ]; then
	mkdir "$DIR/build"
fi

cd "$DIR/build"

# Clean env
if [ -d "$PXEDIR/livecd" ]; then
	rm -Rf "$PXEDIR/livecd"
	mkdir "$PXEDIR/livecd"
fi
if [ -d "$DIR/build/tftpboot" ]; then
	rm -Rf "$DIR/build/tftpboot"
fi

# Generate livecd
livecd-creator -c $DIR/kickstart/centos-7-live-base.ks --releasever=7 -f centos7-livecd

# Extract initrd / vmlinuz
livecd-iso-to-pxeboot centos7-livecd.iso

# Copy in place
cp -ax "$DIR/build/tftpboot/vmlinuz0" "$PXEDIR/livecd/"
cp -ax "$DIR/build/tftpboot/initrd0.img" "$PXEDIR/livecd/"