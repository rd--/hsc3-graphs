include Makefile.graphs

% : %.hs
	ghc -Wall -fwarn-tabs --make $<

all: $(GRAPHS)

clean:
	rm -f $(GRAPHS)
	rm -f *.hi *.o

dep:
	echo -n "GRAPHS=" > Makefile.graphs
	ls *.hs | sed -r -e 's/(.*)\.hs/ \1\\/g' \
		>> Makefile.graphs
