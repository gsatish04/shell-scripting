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

echo -e "word1\t\tword2"

# Colored Output
# Syntax: echo -e "\e[COLmMessage"

## Colors     Code
# Red       31
# Green     32
# Yellow    33
# Blue      34
# Magenta   35
# Cyan      36

echo -e "\e[31mText in Red Color"
echo -e "\e[32mText in Green Color"
echo -e "\e[33mText in Yellow Color"
echo -e "\e[34mText in Blue Color"
echo -e "\e[35mText in Magenta Color"
echo -e "\e[36mText in Cyan Color"




