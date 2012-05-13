#!/bin/bash

for str in `ls`; do
    if [[ -d $str/.git ]]; then
        echo Updating $str
        ( cd $str; git pull )
    fi
done
