#!/bin/bash

for i in *.dot
do
    zcat $i | dot -Tpdf -o ../pdf/$(basename $i .dot).pdf
done
