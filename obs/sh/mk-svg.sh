#!/bin/bash

if [ -d dot ]
then
    for i in dot/*.dot
    do
        o=svg/$(basename $i .dot).svg
        if test -f $o
        then echo "$o exists"
        else
            echo "svg: $o"
            dot $i -Tsvg -o $o
        fi
    done
fi

