#!/usr/bin/env bash

function find-prints {
    grep 'console.log\|varlog\|log(' -rinI --exclude-dir=web --exclude-dir=node_modules . 2>&1 \
        | grep -vE 'remove-prints|No such file|build\.js|prettier' \
        | cut -d: -f1,2 # \
        #| perl -pe 's/^\s+//g'
}

function comment-out-prints {
    while IFS=':' read -r FILE NUM; do
        out=`sed $NUM's/^/\/\/ /' $FILE`
        echo "$out" > $FILE
        #echo $line
        #cat $filename | grep "$line" --color
    done < <(find-prints)
}


#find-prints
#echo -e "\n\n"
comment-out-prints
