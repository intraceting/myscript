#!/bin/bash
#
# This file is part of MYSCRIPT.
#  
# MIT License
##

#
SHELLDIR=$(cd `dirname $0`; pwd)

#
${SHELLDIR}/get-os-id.sh | grep -iE "${1}" |wc -l