all:
	echo "hsc3-graphs"

mk-cmd:
	(cd cmd ; make all)

clean:
	(cd cmd ; make clean)
	cabal clean

push-rd:
	darcs push -a rd@rohandrape.net:sw/hsc3-graphs

pull-rd:
	darcs pull -a http://rohandrape.net/sw/hsc3-graphs
