#!/bin/sh
#
# This file is part of MYSCRIPT.
#  
# MIT License
##
#
SHELL_DIR=$(cd `dirname $0`; pwd)

#
if [ $(${SHELL_DIR}/check_os_id.sh "Ubuntu|Debian") -ge 1 ];then
	echo "deb"
elif [ $(${SHELL_DIR}/check_os_id.sh "CentOS|Red Hat|RedHat|RHEL|fedora|Amazon|amzn|Oracle") -ge 1 ];then
	echo "rpm"
else
	echo ""
fi