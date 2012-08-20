#!/bin/bash
for i in *.dot.gz
do
    zcat $i | dot -Tpdf -o ../pdf/$(basename $i .dot.gz).pdf
done
