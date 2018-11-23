%.svg : %.dot
	dot -T svg $< -o $@

all: analog-bubbles.sc.svg berlin-1977.sc.svg why-supercollider.sc.svg

install:
	cp *.svg ../svg

clean:
	rm *.svg
