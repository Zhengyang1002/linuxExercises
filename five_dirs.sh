#!/bin/bash

mkdir five
cd five

for dir_num in {1..5}
do
    mkdir "dir$dir_num"
    cd "dir$dir_num"

    for file_num in {1..4}
    do
        for holder in $(seq $file_num)
        do
            echo "$file_num" >> "file$file_num"
        done
    done

    cd ..
done
