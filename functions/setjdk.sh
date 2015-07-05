function setjdk() {  
    if [ $# -ne 0 ]; then  
        export JAVA_HOME=`/usr/libexec/java_home -v $@`  
    fi  
    java -version  
} 
