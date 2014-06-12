#!/bin/sh

d=$HOME/sw/hsc3-graphs/
f=$1
g=$f.html

echo scd-to-html d=$d f=$f g=$g

rm -f $g
cat $d/html/scd/pre.html > $g
cat $f >> $g
cat $d/html/scd/post.html >> $g
