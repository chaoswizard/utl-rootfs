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


myfssuffix=".yaffs"
myftpdir="/media/sf_MyCodeDesign/"
myburnfs="rootfs.img"

date_now=`date +%y%m%d%H%M`

myfsimg=${my_rootfs}${myfssuffix} 

ftp_burn_fs=${myftpdir}${myburnfs}
ftp_burn_fs_bak=${myftpdir}${myburnfs}"_bak"${date_now}



echo "make  ${my_rootfs} to yaffs image: ${myfsimg}"
./mkyaffs2image-128M  ${my_rootfs} ${myfsimg}


echo "backup ${ftp_burn_fs} to  ${ftp_burn_fs_bak}"

mv -f ${ftp_burn_fs}  ${ftp_burn_fs_bak}

echo "copy ${myfsimg} to  ${ftp_burn_fs}"

cp -f ${myfsimg}  ${ftp_burn_fs}
