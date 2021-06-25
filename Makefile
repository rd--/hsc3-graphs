all:
	echo "hsc3-graphs"

mk-cmd:
	(cd cmd ; make all ; make install)

clean:
	rm -Rf dist dist-newstyle *~
	(cd cmd ; make clean)

push-all:
	r.gitlab-push.sh hsc3-graphs
