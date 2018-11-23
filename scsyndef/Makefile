%.dot : %.scsyndef
	hsc3-scsyndef-to-dot $<

all: analog-bubbles.sc.dot berlin-1977.sc.dot why-supercollider.sc.dot

install:
	cp *.dot ../dot

clean:
	rm *.dot
