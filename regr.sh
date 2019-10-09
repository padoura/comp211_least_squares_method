#!/bin/bash
argc=$#
argv=("$@")
result=""

function colorOff(){
    echo -e "\033[0m"
}

function errorEcho(){
    echo -e "\033[0;31m"
    echo -e "$1"
    colorOff
}

function infoEcho(){
    echo -e "\033[0;33m"
    echo -e "$1"
    colorOff
}

function printHelp(){
    echo "..."
    echo "@~> Linear Least Squares Solver <~@"
    echo "usage: regr.sh [ -h or --help ] You are here"
    echo "..."
    exit    
}

function printHelpIfInvoked(){
    for (( j=0; j<argc; j++ )); do
        arg=${argv[j]}
        if [ "$arg" == "--help" ] || [ "$arg" == "-h" ]; then
            printHelp
        fi    
    done
}

function parseInputFiles(){
    for (( j=0; j<argc; j++ )); do
        arg=${argv[j]}
        
        if [ ! -f "$arg" ] ; then
            result="${result}FILE: $arg, invalid path\n"
        elif [ "$(wc -l < $arg)" -lt "3" ]; then
            result="${result}FILE: $arg, not enough data -at least 3 data points needed-\n"
        fi

    done
}

function printResult(){
    printf "$result"
}

printHelpIfInvoked
parseInputFiles
printResult




