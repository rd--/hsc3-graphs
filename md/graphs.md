# hsc3-graphs

To install type `cabal install` from the `hsc3-graphs` directory.

To use set the environment variable `HSC3_DIR` to point to a copy of the `hsc3` archive.

~~~~
$ hsc3-graphs -h
hsc3-graphs command [arguments]
 db polyglot autogen
 fragments {hs} {play | draw | dump-ugens} FILE-NAME
$
~~~~

## db

Command to manage the polyglot graph database.

## fragments

Command to read a graph fragment in an indicated language from a named
file and to either draw or print or play it.
