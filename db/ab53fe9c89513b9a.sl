(* 200060927 ; rd ; texture *)
{ :tr |
	let e = Decay2(
		Impulse({ TRand(10, 13, tr) } ! 2, 0),
		TRand(0.001, 0.01, tr),
		TRand(0.005, 0.02, tr)
	);
	let f = { TRand(4, 7, tr) } ! 2 * SinOsc({ TRand(10, 13, tr) } ! 2, 0) * e;
	let r = { TRand(2220, 2227, Impulse(0.7, 0)) } ! 2;
	SinOsc(r, 0) * f * 0.15
}.OverlapTexture(2, 4, 2).Mix
