#!/bin/sh
#
# This file is part of MYSCRIPT.
#  
# MIT License
##

#
CURDIR=$(cd `dirname $0`; pwd)

#
${CURDIR}/get_os_id.sh | grep -iE "${1}" |wc -l