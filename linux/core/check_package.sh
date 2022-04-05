#!/bin/sh
#
# This file is part of MYSCRIPT.
#  
# MIT License
##
#
SHELL_DIR=$(cd `dirname $0`; pwd)

# 0 is ok,!0 is not ok.
STATUS="1"
#
KIT_NAME=$(${SHELL_DIR}/get_kit_name.sh)

#
if [ "deb" == "${KIT_NAME}" ];then 
    STATUS=$(dpkg -V ${1} >> /dev/null 2>&1 ; echo $?)
elif [ "rpm" == "${KIT_NAME}" ];then
	STATUS=$(rpm -q ${1} >> /dev/null 2>&1 ; echo $?)
fi

#
echo "${STATUS}"
