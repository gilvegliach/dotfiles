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

root="$HOME/Scripts"
bin=( $(eval echo "${root}/{public,private}/bin") ) 
sourced=( $(eval echo "${root}/{public,private}/sourced") )

for folder in "${sourced[@]}"; do
    if [ -d "$folder" ]; then
        for file in $folder/*; do
            source "$file"
        done
    fi
done

for folder in "${bin[@]}"; do
   export PATH="$PATH:$folder"
done

# Restore nullglob
if [ $is_nullglob_enabled -ne 0 ]; then
    shopt -u nullglob
fi

unset is_null_glob
unset folder
unset bin
unset sourced
unset file
