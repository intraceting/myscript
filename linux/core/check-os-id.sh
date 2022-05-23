#!/bin/bash
#
# This file is part of MYSCRIPT.
#  
# MIT License
##

#
CURDIR=$(cd `dirname $0`; pwd)

#
${CURDIR}/get-os-id.sh | grep -iE "${1}" |wc -l