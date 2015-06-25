mk-html:
	mkdir -p html
	cp -f css/emacs.css html/hscolour.css
	sh sh/mk-html.sh

mk-pdf:
	mkdir -p pdf
	(cd dot.gz ; sh ../sh/mk-pdf.sh)

mk-svg:
	mkdir -p svg
	sh sh/mk-svg.sh

mk-ix:
	mkdir -p md
	(cd hs; runhaskell mk-ix.hs hsc3-graphs)

mk-lib:
	mkdir -p Sound/SC3/Graph
	(cd hs; runhaskell mk-lib.hs)

# mk-pdf fails at sp.org, html is quasi obsolete
all: mk-svg mk-ix

clean:
	(cd gr; make clean)
	cabal clean
	rm -f pdf/*.pdf
	rm -f svg/*.svg
	rm -R Sound
	rm -f hs/hsc3-graphs.hs

push-sp:
	darcs push -a rd@slavepianos.org:sw/hsc3-graphs

pull-sp:
	darcs pull -a http://rd.slavepianos.org/sw/hsc3-graphs

remote-update:
	ssh rd@slavepianos.org "(cd sw/hsc3-graphs; make all)"
