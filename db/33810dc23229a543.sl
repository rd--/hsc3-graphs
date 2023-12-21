(* https://scsynth.org/t/6452 *)
var f = { :p |
	var f1 = p.first, f2 = p.second, l1 = 0.125, l2 = 8;
	var o1 = { SinOsc(Rand(f1, f2) * Line(l1, l2, 60), 0) } !+ 128;
	var o2 = { SinOsc(Rand(f1, f2) * Line(l2, l1, 60), 0) } !+ 128;
	(o1 + o2) / 128
};
f([20 20000; 20 200; 200 2000; 2000 20000].atRandom)
