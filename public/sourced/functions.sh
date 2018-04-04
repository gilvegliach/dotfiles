#!/usr/bin/env bash
function showcert {
  local cert="$1"
  echo | openssl s_client -servername "$cert" -connect "${cert}:443" 2>/dev/null | openssl x509 -text
}

function base64decode {
  __rem=$((${#1} % 4))
  if [[ $rem -eq 2 ]]; then __s="$1"'=='
  elif [[ $rem -eq 3 ]]; then __s="$1"'='
  else __s="$1"; fi
  (echo $__s | base64 -D)
}

function hex {
  echo -n "$1" | perl -pe 's/(.)/sprintf("\\x%x", ord($1))/eg; END {print "\n"}'
}

function ipaddr() {
    (awk '{print $2}' <(ifconfig en0 | grep 'inet '));
}

function mkcd () {
    mkdir -p -- "$1" && cd -P -- "$1"
}

function rot13 {
    echo "$*" | tr 'A-Za-z' 'N-ZA-Mn-za-m'
}

function setjdk() {
    if [ $# -ne 0 ]; then
        export JAVA_HOME=`/usr/libexec/java_home -v $@`
    fi
    java -version
}

function show() {
    local p=$(type -p "$1")
    if [[ -n "$p" ]]; then
        echo "$1 is a file: $p"
        echo
        cat "$p"
    else
        type "$1"
    fi
}

# Use Commands for autocompletion of show function's input
complete -c show
