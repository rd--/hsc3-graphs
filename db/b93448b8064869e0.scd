// 27 Oktober 2022 ; https://github.com/lukiss/Losers-Union-SC-Research
var a = [41, 73, 123, 196];
var f = SinOsc.ar(440, 0);
(0 .. 8).do { | i |
	a = a * 5.midiratio;
	f = SinOsc.ar(f * a.rotate(i + 3), 0) * SinOsc.ar(f, 0).tanh
};
Splay.ar(
	LeakDC.ar(
		f.tanh
	),
	SinOsc.kr(f.sum.abs, 0)
)
