all:
	echo "hsc3-graphs"

install:
	cabal v1-install --allow-newer

clean:
	rm -Rf dist dist-newstyle *~
	(cd cmd ; make clean)

mk-cmd:
	(cd cmd ; make all ; make install)

push-all:
	r.gitlab-push.sh hsc3-graphs
	r.github-push.sh hsc3-graphs

remote-setup:
	(cd www/lib/scsynth-wasm-builds ; git pull)
	(cd www/lib/jssc3 ; git pull)
	cp www/lib/scsynth-wasm-builds/jssc3/dist/jssc3.js www/lib/jssc3/dist/

remote-update:
	ssh rd@rohandrape.net "(cd rohandrape.net/pub/hsc3-graphs ; git pull ; make remote-setup)"

indent:
	fourmolu -i Sound cmd
	spl-indent lib/scd/graph/*.scd

doctest:
	doctest -Wno-x-partial -Wno-incomplete-uni-patterns Sound
