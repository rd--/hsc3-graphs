// 20 jan. 2023 ; https://github.com/lukiss/Losers-Union-SC-Research
var l = { | lo hi |
	TChoose.ar(
		Dust.ar(3 ! 2),
		CuspN.ar(1.1 ** (0 .. 5), 1, 1.9, 0).tanh
	).exprange(lo, hi)
};
var a = ({ l.(0.001, 1) } ! 3).perfectShuffle ++ ({ l.(1, 0.001) } ! 3);
var f = l.(12, 999);
var e = EnvGen.ar(Env(a, a / a.sum, a.neg * 9).circle(0, 'lin'), 1, 1, 0, 1 / f, 0);
var g = EnvGen.ar(Env.perc(0.005, 0.9 / f), e > 0.1, 1, 0, 1, 0);
Splay.ar((e.blend((e * f).sin, 1 - g) + g).tanh)
