{- https://scsynth.org/t/6452 -}
let f = { :p |
	let f1 = p.first; let f2 = p.second; let l1 = 0.5; let l2 = 2;
	let tr = Impulse(10, 0);
	let o1 = { SinOsc(TRand(f1, f2, tr) * Line(l1, l2, 60), 0) } !+ 128;
	let o2 = { SinOsc(TRand(f1, f2, tr) * Line(l1, l2, 60), 0) } !+ 128;
	(o1 + o2) / 128
};
f([20 20000; 20 2000; 200 2000; 20 200].atRandom)
