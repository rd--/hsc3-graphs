(* Suspect jazz ; https://github.com/lukiss/Losers-Union-SC-Research *)
var x = HenonL(1 + LfdNoise1(3).ExpRange(0.01, 1) * 8, 1.4, 0.3, 0, 0).Fold2(1);
var t = (0 .. 8).collect { :n |
	PulseDivider(x, 8, 7 - n)
};
var d = 1.5 + x.ExpRange(0.01, 1);
var e = { :c |
	Perc(t, 0.004, d, c)
};
var c = [0 3 7 -2];
var f = Demand(
	t,
	0,
	[
		Drand(inf, c),
		Dxrand(inf, 48 + (0 .. 2).collect { :o |
			o * 12 + c
		}.concatenation)
	].Sum
).MidiCps;
var o = SinOsc(
	(BrownNoise() * 0.015 + 1) * f,
	(BrownNoise() / 4 * SinOsc([3.25 0.5 2] * f, 0) * e(-28)).Sum
) * e(-6) * (SinOsc(d + 2, 0) * 0.25 + 0.5);
Splay(o, 3 / 4)
