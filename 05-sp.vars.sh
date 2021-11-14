#!/bin/bash

#0 is script name

echo 0 = $0

#First argument to script
echo 1 = $1
#second argument to script
echo 2 = $2

## * and @ are giving all the arguments
echo "* = $*"
echo "@ = $@"

# number of values which are parsed
echo "# = $#"

echo -e "your name = $1\nyour age = $2"




