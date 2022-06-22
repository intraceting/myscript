#!/bin/bash
#
# This file is part of MYSCRIPT.
#  
# MIT License
##

#
SHELLDIR=$(cd `dirname $0`; pwd)

#
STATUS=$(${SHELLDIR}/../core/check-package.sh dpkg-dev)
if [ ${STATUS} -ne 0 ];then
{
    echo "Pre-Depends: "
    exit 1
}
fi

#
ROOT_PATH=$1
EXE_FILES="";

#遍历项目的目录，找so和exe文件。
for FILE in `find ${ROOT_PATH}/ -type f`
do
	CHK=$(ldd "${FILE}" 2>&1 >>/dev/null; echo $?)
	if [ ${CHK} -eq 0 ];then
		EXE_FILES="${FILE} ${EXE_FILES}"
	fi
done

#
DEPENDS=$(cd ${ROOT_PATH};dpkg-shlibdeps -e ${EXE_FILES} -O 2>/dev/null)
echo -n ${DEPENDS/shlibs:Depends=/Pre-Depends:}
exit 0