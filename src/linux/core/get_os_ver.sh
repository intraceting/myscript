#!/bin/sh
#
# This file is part of MYSCRIPT.
#  
# MIT License
##

#
CURDIR=$(cd `dirname $0`; pwd)

#
if [ -f /etc/os-release ];then 
    grep '^VERSION_ID=' /etc/os-release |cut -d = -f 2 |sed 's/\"//g'
elif [ -f /usr/lib/os-release ];then 
    grep '^VERSION_ID=' /usr/lib/os-release |cut -d = -f 2 |sed 's/\"//g'
else 
    echo "0"
fi 