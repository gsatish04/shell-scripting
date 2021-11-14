#!/bin/bash


## To print some text on screen then we can use echo command or printf command
## we choose to go with echo command because of its less syntaxing.

#syntax
# echo message to print

echo Hello World
echo Welcome

# ESC sequences, \n (new line), \e (new tab)

# syntax : echo -e "message\nnew line"
# To enable any esc seq we need to enable -e option.
# Also the input should be in quotes, preferably double quotes.

echo -e "Hello World\nWelcome"
