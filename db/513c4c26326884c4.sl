{- Fast lfos with slow beats -}
{ :tr |
	let a0 = TRand(40, 240, tr);
	let a1 = a0 + TRand(-1, 1, tr);
	let a = [a0, a1];
	let b = TRand(0, 2000, tr);
	let c = { TRand(-1, 1, tr) } ! 2 + a;
	SinOsc(SinOsc(a, 0) * TRand(0, 1, tr) * b + b, 0) * (SinOsc(c, 0) * 0.05 + 0.05)
}.OverlapTexture(8, 4, 4).Mix * 0.25
