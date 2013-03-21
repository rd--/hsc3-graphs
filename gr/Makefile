include Makefile.graphs

% : %.hs
	ghc -Wall -fwarn-tabs -O0 --make $<

%.html : %.hs
	HsColour -icss $< -o$*.html

all: $(GRAPHS)

clean:
	rm -f $(GRAPHS)
	rm -f *.packages *.cabal
	rm -f *.hi *.o *.hspp
	rm -f *.hers

dep:
	bash ../sh/mk-dependencies.sh

packages:
	bash ../sh/mk-packages.sh
