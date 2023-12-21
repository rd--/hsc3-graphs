// Feedback loop ; https://github.com/lukiss/Losers-Union-SC-Research
var i = LocalIn.ar(2, 0);
var o = Splay.ar(
	LeakDC.ar(
		DelayC.ar(
			i + ((1 + i) ** 0.999),
			1,
			SinOsc.ar(0.01 / (1 .. 8), 0).exprange(0.01, 1)
		),
		0.995
	).tanh
);
LocalOut.ar(o);
LPF.ar(o, 5000) / 5
