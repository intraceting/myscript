#!/bin/sh
#
# This file is part of MYSCRIPT.
#  
# MIT License
##

#
SHELL_DIR=$(cd `dirname $0`; pwd)

#
${SHELL_DIR}/get_os_id.sh | grep -iE "${1}" |wc -l