(* 20 jan. 2023 ; https://github.com/lukiss/Losers-Union-SC-Research *)
var l = { :lo :hi |
	TChoose(
		Dust(3 ! 2),
		CuspN(1.1 ^ (0 .. 5), 1, 1.9, 0).Tanh
	).ExpRange(lo, hi)
};
var a = { l(0.001, 1) } ! 6;
var f = l(12, 999);
var e = Env(a, a / a.Sum / f, a.Neg * 9, nil, nil, 0).circle(0, 'lin').asEnvGen(1);
var g = Perc(e > 0.1, 0.005, 0.9 / f, -4);
var p = (1 - g).LinLin(0, 1, -1, 1);
(XFade2(e, (e * f).Sin, p, 1) + g).Tanh.Splay
