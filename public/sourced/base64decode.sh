#!/usr/bin/env bash
function base64decode {
  __rem=$((${#1} % 4))
  if [[ $rem -eq 2 ]]; then __s="$1"'=='
  elif [[ $rem -eq 3 ]]; then __s="$1"'='
  else __s="$1"; fi
  (echo $__s | base64 -D)
}
