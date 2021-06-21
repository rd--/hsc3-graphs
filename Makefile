GL_GIT=git@gitlab.com:rd--/hsc3-graphs.git
GL_HTTP=https://gitlab.com/rd--/hsc3-graphs.git

all:
	echo "hsc3-graphs"

mk-cmd:
	(cd cmd ; make all ; make install)

clean:
	rm -Rf dist dist-newstyle *~
	(cd cmd ; make clean)

push-gl:
	git push $(GL_GIT)

pull-gl:
	git pull $(GL_HTTP)

update-rd:
	ssh rd@rohandrape.net "(cd sw/hsc3-graphs; git pull $(GL_HTTP))"

push-all:
	make push-gl update-rd
