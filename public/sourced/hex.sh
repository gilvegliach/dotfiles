#!/usr/bin/env bash
function hex {
  echo -n "$1" | perl -pe 's/(.)/sprintf("\\x%x", ord($1))/eg; END {print "\n"}'
}