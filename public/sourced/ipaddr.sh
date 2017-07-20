function ipaddr() { 
    (awk '{print $2}' <(ifconfig en0 | grep 'inet ')); 
}
