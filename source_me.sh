#!/bin/bash
#
# Source this file in your .profile or .bash_profile. This file
# imports bash functions and aliases and adds executables to PATH
#
scripts_dir="~/Scripts"
#TODO: fix these two variables
#functions_dir="${scripts_dir}/functions"
#functions_files=${scripts_dir}/functions/*

if [ -d ~/Scripts/functions ]; then
    for file in ~/Scripts/functions/*; do
        source "$file"
    done
fi

if [ -d ~/Scripts/aliases ]; then
    for file in ~/Scripts/aliases/*; do
        source "$file"
    done
fi

executables_dir="${scripts_dir}/executables"
export PATH=$PATH:"$executables_dir"