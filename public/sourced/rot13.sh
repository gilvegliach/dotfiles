function rot13 {
    echo "$*" | tr 'A-Za-z' 'N-ZA-Mn-za-m'
}
