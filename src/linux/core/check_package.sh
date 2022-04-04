#!/bin/sh
#
# This file is part of MYSCRIPT.
#  
# MIT License
##
#
CURDIR=$(cd `dirname $0`; pwd)

#
STATUS="1"
KIT_NAME=$(${CURDIR}/get_kit_name.sh)

#
if [ "deb" == "${KIT_NAME}" ];then 
    STATUS=$(dpkg -V ${1} >> /dev/null 2>&1 ; echo $?)
elif [ "rpm" == "${KIT_NAME}" ];then
	STATUS=$(rpm -q ${1} >> /dev/null 2>&1 ; echo $?)
fi

#
echo "${STATUS}"
