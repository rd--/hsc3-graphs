mk-html:
	mkdir -p html
	cp -f css/emacs.css html/hscolour.css
	sh sh/mk-html.sh

mk-pdf:
	mkdir -p pdf
	(cd dot ; sh ../sh/mk-pdf.sh)

mk-svg:
	mkdir -p svg
	sh sh/mk-svg.sh

mk-ix:
	mkdir -p md
	(cd hs; runhaskell mk-ix.hs hsc3-graphs)

mk-lib:
	mkdir -p lib/Sound/SC3/Graph
	(cd hs; runhaskell mk-lib.hs)

append-exec:
	hsc3-setup cabal print-exec hsc3- gr/*.hs >> hsc3-graphs.cabal

# mk-pdf fails at rd.net, html is quasi obsolete
all: mk-svg mk-ix

clean:
	(cd gr; make clean)
	cabal clean
	rm -f pdf/*.pdf
	rm -f svg/*.svg
	rm -Rf lib/Sound
	rm -f lib/*.o lib/*.hi lib/*.hs lib/hsc3-graphs
	rm -f html/*.html html/*.htm html/*.fs html/*.css

push-rd:
	darcs push -a rd@rohandrape.net:sw/hsc3-graphs

pull-rd:
	darcs pull -a http://rohandrape.net/sw/hsc3-graphs

remote-update:
	ssh rd@rohandrape.net "(cd sw/hsc3-graphs; make all)"
