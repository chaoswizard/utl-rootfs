#!/bin/sh

#cmd with  param atleast is 1 and is a valid path.
if [ -d $1 ] && [ $# -ge 1 ]
then
my_rootfs=`echo $1 | tr -d "/"`
else
echo "usage: $0 valid dir which existed"
# Will exit with status of last command.
exit $?
fi


myfssuffix=".ramdisk"
myftpdir="/media/sf_MyCodeDesign/"
myburnfs="rootfs.img"

date_now=`date +%y%m%d%H%M`

mytmp_fsimg=${my_rootfs}${myfssuffix} 
myfsimg=${mytmp_fsimg}".gz"

ftp_burn_fs=${myftpdir}${myburnfs}
ftp_burn_fs_bak=${myftpdir}${myburnfs}"_bak"${date_now}



echo "make  ${my_rootfs} to ramdisk image: ${mytmp_fsimg}"
./genext2fs-1.4.1/genext2fs -b 4096  -d  ${my_rootfs}  ${mytmp_fsimg}

echo "compress  ${mytmp_fsimg} to : ${myfsimg}"
rm -f  ${myfsimg}
gzip -9 -f ${mytmp_fsimg}
rm -f  ${mytmp_fsimg}

echo "backup ${ftp_burn_fs} to  ${ftp_burn_fs_bak}"

mv -f ${ftp_burn_fs}  ${ftp_burn_fs_bak}

echo "copy ${myfsimg} to  ${ftp_burn_fs}"

cp -f ${myfsimg}  ${ftp_burn_fs}

