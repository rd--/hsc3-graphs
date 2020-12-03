#!/bin/bash

o="Makefile.graphs"
echo -n "GRAPHS=" > $o
ls *.hs | sed -r -e 's/(.*)\.hs/ \1\\/g' >> $o
