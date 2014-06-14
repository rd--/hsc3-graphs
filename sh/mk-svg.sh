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

if [ -d dot.gz ]
then
    for i in dot.gz/*.dot.gz
    do
        o=svg/$(basename $i .dot.gz).svg
        if test -f $o
        then echo "$o exists"
        else
            echo "svg: $o"
            zcat $i | dot -Tsvg -o $o
        fi
    done
fi

