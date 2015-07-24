#!/bin/bash
#
# Source this file in your .profile or .bash_profile. This file
# imports bash functions and aliases and adds executables to PATH
#

# Brace expansion is evaluated before parameter expansion, so we
# use eval to evaluate the assigments twice: it first expands the
# parameters and then performs the brace expansion during the eval.
# The results are put in arrays to make it easier to loop through

root="~/Scripts"
functs=( `eval echo "${root}/{public,private}/functions"` )
aliases=( `eval echo "${root}/{public,private}/aliases"` ) 
execs=( `eval echo "${root}/{public,private}/executables"` ) 

# Termporary, remove
source ~/Scripts/private/aliases/zalando

for fun in "${functs[@]}"; do
    if [ -d $fun ]; then
        for file in $fun/*; do
            source "$file"
        done
    fi
done

for als in "${aliases[@]}"; do
    if [ -d $als ]; then
        for file in $als/*; do
            source "$file"
        done
    fi
done

for exc in "${execs[@]}"; do
   export PATH=$PATH:"$exc"
done

unset fun
unset als
unset exc

unset root
unset functs
unset execs
unset file
