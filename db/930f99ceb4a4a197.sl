;; 200060927 ; rd ; texture
OverlapTexture({ :tr |
	var e = Decay2(Impulse({ TRand(10, 13, tr) } ! 2, 0), TRand(0.001, 0.01, tr), TRand(0.005, 0.02, tr));
	var f = { TRand(4, 7, tr) } ! 2 * SinOsc({ TRand(10, 13, tr) } ! 2, 0) * e;
	var r4 = { TRand(2220, 2227, Impulse(0.7, 0)) } ! 2;
	SinOsc(r4, 0) * f * 0.15
}, 2, 4, 2)