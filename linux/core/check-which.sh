#!/bin/bash
#
# This file is part of MYSCRIPT.
#  
# MIT License
##
#
SHELLDIR=$(cd `dirname $0`; pwd)

#
if [ $# -ne 1 ];then
{
    echo "22"
    exit 22
}
fi

#0 已安装，!0 未安装。
STATUS="1"

#
STATUS=$(which ${1} >> /dev/null 2>&1 ; echo $?)

#
echo "${STATUS}"