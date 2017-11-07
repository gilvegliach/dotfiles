#!/usr/bin/env bash
function g() {
  keywords="$@"
  open -a "Google Chrome" \
    "http://google.com/search?sourceid=chrome&ie=UTF-8&q=$keywords"
}

function i() {
  keywords="$@"
  open -a "Google Chrome" \
    "https://www.google.com/search?tbm=isch&q=$keywords"
}

#function v() {
#  keywords="$@"
#  open -a "Google Chrome" \
#   "http://www.youtube.com/results?search_query=$keywords" 
#}

function m() {
  keywords="$@"
  open -a "Google Chrome" \
    "https://www.google.com/maps/search/$keywords"
}

function amze() {
  keywords="$@"
  open -a "Google Chrome" \
    "https://www.amazon.com/s/ref=nb_sb_noss_2?field-keywords=$keywords"
}

function amz() { 
  keywords="$@"
  open -a "Google Chrome" \
    "https://www.amazon.de/s/ref=nb_sb_noss?field-keywords=$keywords" 
}
