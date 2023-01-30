;; https://scsynth.org/t/6452
var f = { :p |
	var f1 = p.first, f2 = p.second, l1 = 0.5, l2 = 2;
	var o1 = { SinOsc(TRand(f1, f2, Impulse(10, 0)) * Line(l1, l2, 60, 2), 0) } !+ 128;
	var o2 = { SinOsc(TRand(f1, f2, Impulse(10, 0)) * Line(l1, l2, 60, 2), 0) } !+ 128;
	EqPan2(o1 + o2, 0) / 128
};
f([[20, 20000], [20, 2000], [200, 2000], [20, 200]].atRandom)
