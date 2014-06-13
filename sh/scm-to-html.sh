#!/bin/sh

d=$HOME/sw/hsc3-graphs/
f=$1
g=$f.html

echo scm-to-html d=$d f=$f g=$g

rm -f $g
cat $d/html/scm/pre.html > $g
cat $f >> $g
cat $d/html/scm/post.html >> $g
