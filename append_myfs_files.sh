#!/bin/sh
echo "install  glibc to rootfs"
cp /usr/local/arm/4.4.3/lib/*.so* myfs_top_dir/lib
