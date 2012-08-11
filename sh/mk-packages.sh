#!/bin/bash

function mk_packages
{
    i=$1.hs
    o=$1.packages
    grep '{-.*-}' $i | \
        sed -e 's/.*{- //g' | \
        sed -e 's/ -}//g' | \
        xargs echo | \
        sed -e 's/ /,/g' > $o
}

function mk_cabal
{
    o=$1.cabal
    read < $1.packages p
    echo "Executable "$1 > $o
    echo " main-is: src/"$1".hs" >> $o
    echo " build-depends: base,"$p >> $o
}

for i in *.hs ; do mk_packages $(basename $i .hs) ; done
for i in *.hs ; do mk_cabal $(basename $i .hs) ; done

c="../hsc3-graphs.cabal"
d=$(date)
echo "-- Auto-generated: "$d >> $c
cat *.cabal >> $c
