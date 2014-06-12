#!/bin/bash

d=$HOME/sw/hsc3-graphs

for i in *.hs
do
    HsColour -css $i -o../html/$i.html
done

for i in *.scd
do
    sh $d/sh/scd-to-html.sh $i
done
