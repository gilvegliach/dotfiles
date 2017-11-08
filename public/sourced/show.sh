function show() {
    local p=$(type -p "$1")
    if [[ -n "$p" ]]; then
        echo $p
        echo
        cat "$p"
    else
        echo "$1 is not a file"
    fi
}

# Use Commands for autocompletion of show function's input
complete -c show
