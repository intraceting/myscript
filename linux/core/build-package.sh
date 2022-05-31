#!/bin/bash
#
# This file is part of MYSCRIPT.
#  
# MIT License
##
#
SHELLDIR=$(cd `dirname $0`; pwd)

#
if [ $# -ne 2 ];then
{
    echo "22"
    exit 22
}
fi

#
KIT_NAME=$(${SHELLDIR}/get-kit-name.sh)