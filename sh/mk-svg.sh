#!/bin/bash
if [ -d dot ]
then
    for i in dot/*.dot
    do
        dot $i -Tsvg -o svg/$(basename $i .dot).svg
    done
fi

if [ -d dot.gz ]
then
    for i in dot.gz/*.dot.gz
    do
        zcat $i | dot -Tsvg -o svg/$(basename $i .dot.gz).svg
    done
fi

