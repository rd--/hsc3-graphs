;; sc-140 ; 07 ; Thor Magnusson
var a = LfNoise0(8);
EqPan2([
	SinOsc(Pulse(1, 0.5) * 24, 0),
	SinOsc(90 + (a * 90), 0),
	MoogFf(Saw(LfNoise0(4) * 333 + 666), a * XLn(1, 39, 99) * 99, 2, 0)
].sum, 0) / 3
