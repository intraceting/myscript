#!/bin/sh
#
# This file is part of MYSCRIPT.
#  
# MIT License
##
#
SHELL_DIR=$(cd `dirname $0`; pwd)

#0 is ok,!0 is not ok.
STATUS="1"

#
STATUS=$(which ${1} >> /dev/null 2>&1 ; echo $?)

#
echo "${STATUS}"