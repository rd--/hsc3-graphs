#!/bin/bash

d=$HOME/sw/hsc3-graphs
s=$HOME/sw/rsc3/help/graph

# FORTH
g=$d/fs/gen.fs
echo 0 TO FRAMES > $g
for i in $d/gr/*.fs ; do echo HTML $(basename $i) >> $g ; done
echo CR BYE >> $g
(cd $d/gr ; gforth $d/fs/Forth2HTML.fs $g)
cp $d/gr/*.fs html
mv $d/gr/*.fsu.htm html

# HASKELL
for i in $d/gr/*.hs
do
    o=$d/html/$(basename $i).html
    # if test -f $o then echo "$o exists" else ... fi
    HsColour -css $i -o$i.html
    mv $i.html $o
done

# SUPERCOLLIDER
for i in $d/gr/*.scd
do
    o=$d/html/$(basename $i).html
    # if test -f $o then echo "$o exists" else ... fi #
    sh $d/sh/scd-to-html.sh $i
    mv $i.html $o
done

# SCHEME
for i in $s/*.scm
do
    o=$d/html/$(basename $i).html
    # if test -f $o then echo "$o exists" else ... fi
    sh $d/sh/scm-to-html.sh $i
    mv $i.html $o
done

