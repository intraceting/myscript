#!/bin/bash
#
# This file is part of MYSCRIPT.
#  
# MIT License
##
#
SHELLDIR=$(cd `dirname $0`; pwd)

#
if [ $(${SHELLDIR}/check-os-id.sh "Ubuntu|Debian") -ge 1 ];then
	echo "deb"
elif [ $(${SHELLDIR}/check-os-id.sh "CentOS|Red Hat|RedHat|RHEL|fedora|Amazon|amzn|Oracle") -ge 1 ];then
	echo "rpm"
else
	echo ""
fi