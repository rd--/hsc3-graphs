#!/bin/bash
for i in *.hs
do
    HsColour -css $i -o../html/$i.html
done
