all:
	echo "hsc3-graphs"

mk-cmd:
	(cd cmd ; make all ; make install)

clean:
	rm -Rf dist dist-newstyle *~
	(cd cmd ; make clean)

push-all:
	r.gitlab-push.sh hsc3-graphs
	r.github-push.sh hsc3-graphs

remote-update:
	ssh rd@rohandrape.net "(cd rohandrape.net/pub/hsc3-graphs ; git pull ; (cd www/lib/jssc3 ; git pull) ; (cd www/lib/scsynth-wasm-builds ; git pull))"
