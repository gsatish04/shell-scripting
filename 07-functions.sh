#!/bin/bash

## functions should be always declared before using it, same like variables.
## so that is the reason, Function we always find in starting of the scripts.

function abc () {
  echo iam a function abc
  echo a in function = $a
  b=20
  }

xyz () {
  echo iam a function xyz

}



##main program

a=10
abc
echo b in main program =$b
xyz
