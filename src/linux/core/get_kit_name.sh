#!/bin/sh
#
# This file is part of MYSCRIPT.
#  
# MIT License
##
#
CURDIR=$(cd `dirname $0`; pwd)

#
if [ $(${CURDIR}/check_os_id.sh "Ubuntu|Debian") -ge 1 ];then
	echo "deb"
elif [ $(${CURDIR}/check_os_id.sh "CentOS|Red Hat|RedHat|RHEL|fedora|Amazon|amzn|Oracle") -ge 1 ];then
	echo "rpm"
else
	echo ""
fi