include Makefile.graphs

% : %.hs
	ghc -Wall -fwarn-tabs --make $<

all: $(GRAPHS)

clean:
	rm -f $(GRAPHS)
	rm -f *.packages *.cabal
	rm -f *.hi *.o

dep:
	bash ../sh/mk-dependencies.sh

packages:
	bash ../sh/mk-packages.sh
