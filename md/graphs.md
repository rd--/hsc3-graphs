# hsc3-graphs

To install type `cabal install` from the `hsc3-graphs` directory.

To use set the environment variable `HSC3_DIR` to point to a copy of the `hsc3` archive.

~~~~
$ hsc3-graphs -h
hsc3-graphs command [arguments]
  db polyglot autogen
  db process ext output-directory input-directory
  fragments {hs} {play | draw | dump-ugens} FILE-NAME

    ext = .fs .hs .scala .scd .sch .scm .st
$
~~~~

## db

Manage the polyglot graph database.

`db polyglot autogen` generates the `hsc3-graphs` database.

`db process` reads all files in the language indicated by `ext` from
an input directory, fragments them and then processes the fragments
writing each text and associated `.scyndef` file to an output
directory.

## fragments

Command to read a graph fragment in an indicated language from a named
file and to either draw or print or play it.
