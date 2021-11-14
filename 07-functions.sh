#!/bin/bash

## functions should be always declared before using it, same like variables.
## so that is the reason, Function we always find in starting of the scripts.

function abc () {
  echo iam a function abc
  a=100
  echo a in function = $a
  b=20
  return 30
  echo First Argument in Function = $1
  }

xyz () {
  echo iam a function xyz

}



##main program

a=10
#abc Sati
abc $1
echo exit status of abc = $?
echo b in main program =$b
xyz

echo First Argument in Main Program = $1
