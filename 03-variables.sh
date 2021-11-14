#!/bin/bash

## If you assign a name to set of data, then that is a variable.
# syntax: VAR=Data

# Number
a=100

# String
b=abc

# in bash shell and also by default there are no data types, shell considers everything as string
# acces the data in shell using $ character prefixing the variable name, or you can also access variable with ${}

echo value of a = $a
echo value of b = $b

echo value of a = ${a}

x=10
y=20
echo ${x}X${y} = 200

#Date=2021-11-14
DATE=$(date +%F)
echo Good Morning, Welcome, Today date is $DATE

# Arith Substitution
ADD=$((2+3+4+5+6*7/2-5))
echo added = $ADD





