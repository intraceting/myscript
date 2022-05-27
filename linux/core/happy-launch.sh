#!/bin/bash
#
# This file is part of MYSCRIPT.
#  
# MIT License
##
#
SHELLNAME=$(basename $0)
SHELLDIR=$(cd `dirname $0`; pwd)

#
if [ $# -lt 1 ];then
{
    echo "usage: ${SHELLNAME} < project-path > [ project-name ]"
    exit 22
}
fi

#
PJT_PATH=$(realpath $1)
PJT_NAME=$(basename ${PJT_PATH})

#
if [ $# -eq 2 ];then
PJT_NAME=$2
fi

#
PJT_BIN_PATH="${PJT_PATH}:${PJT_PATH}/bin/"
PJT_LIB_PATH=""

#遍历项目的目录，找so和a库所在目录。
for DIR in `find ${PJT_PATH}/ -type d`
do
	CHK=$(find ${DIR} -maxdepth 1 -type f -name "lib*.so" -o -name "lib*.so.*" -o -name "lib*.a" |wc -l)
	if [ ${CHK} -ge 1 ];then
		PJT_LIB_PATH=${DIR}:${PJT_LIB_PATH}
	fi
done

cat >/etc/profile.d/${PJT_NAME}.sh <<EOF
######
export LD_LIBRARY_PATH=${PJT_LIB_PATH}:\${LD_LIBRARY_PATH}
export PATH=${PJT_BIN_PATH}:\${PATH}
EOF

#
echo "Run 'source /etc/profile' or log in again."