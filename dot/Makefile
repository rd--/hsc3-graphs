%.svg : %.dot
	dot -T svg $< -o $@

all: why-supercollider.sc.svg

install:
	cp *.svg ../svg

clean:
	rm *.svg
