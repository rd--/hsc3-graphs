#!/bin/bash
for i in *.dot.gz
do
    zcat $i | dot -Tsvg -o ../svg/$(basename $i .dot.gz).svg
done
