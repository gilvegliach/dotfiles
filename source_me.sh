#!/bin/bash
#
# Source this file in your .profile or .bash_profile. This file
# imports bash functions and aliases and adds executables to PATH
#

# Brace expansion is evaluated before parameter expansion, so we
# use eval to evaluate the assigments twice: it first expands the
# parameters and then performs the brace expansion during the eval.
# The results are put in arrays to make it easier to loop through

# Remember if nullglob is enabled (zero)
shopt -q nullglob
is_nullglob_enabled=$?

# Nullglob: filename patterns matching no files expand to a null 
# string, rather than to the patterns themselves
shopt -s nullglob

root="~/Scripts"
functs=( `eval echo "${root}/{public,private}/functions"` )
aliases=( `eval echo "${root}/{public,private}/aliases"` ) 
execs=( `eval echo "${root}/{public,private}/executables"` ) 

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

# Restore nullglob
if [ $is_nullglob_enabled -ne 0 ]; then
    shopt -u nullglob
fi

unset is_null_glob
unset fun
unset als
unset exc
unset root
unset functs
unset execs
unset file
