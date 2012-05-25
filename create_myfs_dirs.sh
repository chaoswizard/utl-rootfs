#!/bin/sh
echo "------Create myfs_top_dir directons start...--------"
mkdir myfs_top_dir
cd myfs_top_dir
echo "--------Create root,dev....----------"
mkdir root dev etc boot tmp var sys proc lib mnt home usr
mkdir etc/init.d etc/rc.d etc/sysconfig
mkdir usr/sbin usr/bin usr/lib usr/modules
echo "make node in dev/console dev/null"
mknod -m 600 dev/console c 5 1
mknod -m 600 dev/null c 1 3
mkdir mnt/etc mnt/jffs2 mnt/yaffs mnt/data mnt/temp
mkdir var/lib var/lock var/run var/tmp
chmod 1777 tmp
chmod 1777 var/tmp
echo "-------make direction done---------"
