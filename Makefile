GL_GIT=git@gitlab.com:rd--/hsc3-graphs.git
GL_HTTP=https://gitlab.com/rd--/hsc3-graphs.git

all:
	echo "hsc3-graphs"

mk-cmd:
	(cd cmd ; make all)

clean:
	(cd cmd ; make clean)
	cabal clean

push-gl:
	git push $(GL_GIT)

pull-gl:
	git pull $(GL_HTTP)

update-rd:
	ssh rd@rohandrape.net "(cd sw/hsc3-graphs; git pull $(GL_HTTP))"

push-all:
	make push-gl update-rd
