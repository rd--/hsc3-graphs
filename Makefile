mk-html:
	mkdir -p html
	cp -f css/emacs.css html/hscolour.css
	(cd gr ; sh ../sh/mk-html.sh)

mk-pdf:
	mkdir -p pdf
	(cd dot.gz ; sh ../sh/mk-pdf.sh)

mk-svg:
	mkdir -p svg
	(cd dot.gz ; sh ../sh/mk-svg.sh)

mk-ix:
	mkdir -p md
	(cd hs; runhaskell mk-ix.hs sw/hsc3-graphs)

mk-lib:
	mkdir -p Sound/SC3/Graph
	(cd hs; runhaskell mk-lib.hs)

# mk-pdf fails at sp.org
all: mk-html mk-svg mk-ix

clean:
	(cd gr; make clean)
	cabal clean
	rm -f pdf/*.pdf
	rm -f svg/*.svg
	rm -R Sound
	rm -f hs/hsc3-graphs.hs

remote-update:
	ssh rd@slavepianos.org "(cd sw/hsc3-graphs; make all)"
