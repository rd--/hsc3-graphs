%.dot : %.scsyndef
	hsc3-scsyndef-to-dot $<

all: why-supercollider.sc.dot berlin-1977.sc.dot

install:
	cp *.dot ../dot

clean:
	rm *.dot
