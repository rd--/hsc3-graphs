// https://sccode.org/1-4Qy ; f0 ; 0345
var f = {
	arg i;
	var c = SinOsc.ar(8 - i / 8, 0);
	SinOsc.ar(1 + i, 0).max(c) * SinOsc.ar(SinOsc.ar(i - 2.1, 0) % SinOsc.ar(9, 1) + (SinOsc.ar(1, 0) > 0 / 3 + 1.83) ** i + 99, c + 1 / 4)
};
Splay2.ar(0.to(7).collect(f))/2
