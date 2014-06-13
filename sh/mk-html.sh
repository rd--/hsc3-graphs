#!/bin/bash

d=$HOME/sw/hsc3-graphs
s=$HOME/sw/rsc3/help/graph

for i in $d/gr/*.hs
do
    HsColour -css $i -o$i.html
    mv $i.html $d/html
done

for i in $d/gr/*.scd
do
    sh $d/sh/scd-to-html.sh $i
    mv $i.html $d/html

done

for i in $s/*.scm
do
    sh $d/sh/scm-to-html.sh $i
    mv $i.html $d/html
done
