#!/bin/bash

# $#: number of arguments 

# strict on 2 input arguments
if [[ ("$#" -ne 2) ]];then
    echo "usage: $0 <dir> <n>" 1>&2
    exit 1
fi

dir="$1"
size="$2"

find "$dir" -type f -size +${size} -exec rm {} \;
