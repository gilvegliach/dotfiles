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

root="$HOME/dotfiles"
bin=( "$root/public/bin" "$root/private/bin" ) 
sourced=( "$root/public/sourced" "$root/private/sourced" )

for folder in "${sourced[@]}"; do
    if [ -d "$folder" ]; then
        for file in $folder/*; do
            # shellcheck source=/dev/null
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


# crate symbolic links for files in dotfiles/linked
[[ ! -f "$HOME/.gitignore_global" ]] \
  && ln -s "$root/linked/gitignore_global" "$HOME/.gitignore_global" \
  && git config --global core.excludesfile "$HOME/.gitignore_global"

[[ -d "$HOME/.hammerspoon" ]] && [[ ! -f "$HOME/.hammerspoon/init.lua" ]] \
  && ln -s "$root/linked/init.lua" "$HOME/.hammerspoon/init.lua"

[[ ! -f "$HOME/.inputrc" ]] \
  && ln -s "$root/linked/inputrc" "$HOME/.inputrc"

[[ ! -f "$HOME/.vimrc" ]] \
  && ln -s "$root/linked/vimrc" "$HOME/.vimrc"

[[ ! -d "$HOME/.vim" ]] \
  && ln -s "$root/linked/vim" "$HOME/.vim"

