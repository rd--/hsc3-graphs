(* https://scsynth.org/t/6452 *)
let f = { :p |
	let f1 = p.first; let f2 = p.second; let l1 = 0.125; let l2 = 8;
	let o1 = { SinOsc(Rand(f1, f2) * Line(l1, l2, 60), 0) } !+ 128;
	let o2 = { SinOsc(Rand(f1, f2) * Line(l2, l1, 60), 0) } !+ 128;
	(o1 + o2) / 128
};
f([20 20000; 20 200; 200 2000; 2000 20000].atRandom)
