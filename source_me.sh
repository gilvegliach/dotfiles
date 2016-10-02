#!/usr/bin/env bash
#
# Source this file in your .profile or .bash_profile.
#
# Remember if nullglob is enabled (zero)
shopt -q nullglob
is_nullglob_enabled=$?

# Nullglob: filename patterns matching no files expand to a null 
# string, rather than to the patterns themselves
shopt -s nullglob

root="$HOME/Scripts"
bin=( "$root/public/bin" "$root/private/bin" ) 
sourced=( "$root/public/sourced" "$root/private/sourced" )

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
