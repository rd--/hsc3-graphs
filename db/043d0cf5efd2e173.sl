{- F0 <http://twitter.com/redFrik/status/1367808902457397250> ; requires VarLag -}
let rat = [76.11 76.11 64 57.02 38.05 85.43 32 114.04 42.71 47.95 95.89];
1:10.collect { :i |
	let m = SinOsc(1 / 16, 0) > 0 * 2 + 6 - (SinOsc(SinOsc(1 / 32, i), 0) / 20);
	let f0 = rat[i] * m;
	let w = SinOsc(f0, 0) / 9;
	let x = (SinOsc(1 / 64, 0) * 6 + 6).Floor.VarLag(0.1, 0);
	let y = SinOsc(SinOsc(1 / 4, i / 11 * pi) < 0 * 2, 0) * 0.1;
	let z = y.VarLag(0.01, SinOsc(0.01, i));
	let dly = i + x % 11 / 33 + 0.1 + z;
	let dcy = SinOsc(1 / 9, 0) + 1;
	CombC(w, 0.5, dly, dcy)
}.Splay.Tanh
