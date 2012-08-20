mk-pdf:
	mkdir -p pdf
	(cd dot.gz ; sh ../sh/mk-pdf.sh)

mk-svg:
	mkdir -p svg
	(cd dot.gz ; sh ../sh/mk-svg.sh)

mk-ix:
	mkdir -p md
	(cd hs; runhaskell ix.hs)

all: mk-pdf mk-svg mk-ix

clean:
	(cd gr; make clean)
	rm -f pdf/*.pdf
	rm -f svg/*.svg

remote-update:
	ssh rd@slavepianos.org "(cd sw/hsc3-graphs; make all)"
