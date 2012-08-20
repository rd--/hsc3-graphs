mk-ix:
	(cd hs; runhaskell ix.hs)

mk-pdf:
	(cd dot.gz ; sh ../sh/mk-pdf.sh)

mk-svg:
	(cd dot.gz ; sh ../sh/mk-svg.sh)

clean:
	(cd gr; make clean)
	rm -f pdf/*.pdf
	rm -f svg/*.svg
