(* Mistakes were made ; https://github.com/lukiss/Losers-Union-SC-Research *)
var p = 9 / 7 ^ (0 .. 16);
var c = { :freq |
	LinCongC(freq, 1.1, 0.13, 1, 0)
};
var d = (c(c(p.arcTan) ^ 2 * 4) ^ 4 * 8).Abs;
var t = c(c(d / p.arcTan).RoundTo(1 / d) ^ 4 * d * 8).Sin;
var f = TRand(0, 64, t).Ceiling.MidiCps;
Splay(
	LeakDc(
		Pluck(
			(SinOsc(
				f * p * p.Log,
				0
			) * SinOsc(f * p * p.log / 2, 0) * 2 * d).Sin,
			t,
			0.1,
			t.ExpRange(0.01, 1) / d / p,
			(t ^ 1.5 * f) * (d / p.scramble),
			(p * (1 - t.ExpRange(0.01, 1))).Sin.ExpRange(0.9999, 0.5)
		),
		0.995
	)
).Tanh / 3
