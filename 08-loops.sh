#!/bin/bash

# Loops are mainly two major commands- while and for.
# while loop works on the Expressions that we used in If statements.
# while loop- all the time its control the expressions.

a=10
while [ $a -gt 0 ]; do
  echo while loop
  sleep 0.5
  a=$(($a-1))
done

# above a=10 is it repeats ten times. and double braces (()) means arithamatic expression.

