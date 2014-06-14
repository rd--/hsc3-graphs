#!/bin/bash

d=$HOME/sw/hsc3-graphs
s=$HOME/sw/rsc3/help/graph

for i in $d/gr/*.hs
do
    o=$d/html/$(basename $i .hs).html
    if test -f $o
    then
        echo "$o exists"
    else
        HsColour -css $i -o$i.html
        mv $i.html $o
    fi
done

for i in $d/gr/*.scd
do
    o=$d/html/$(basename $i .scd).html
    if test -f $o
    then
        echo "$o exists"
    else
        sh $d/sh/scd-to-html.sh $i
        mv $i.html $o
    fi

done

for i in $s/*.scm
do
    o=$d/html/$(basename $i .scm).html
    if test -f $o
    then
        echo "$o exists"
    else
        sh $d/sh/scm-to-html.sh $i
        mv $i.html $o
    fi
done
