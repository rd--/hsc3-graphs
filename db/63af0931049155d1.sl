{- Red frik (F0) -}
let tr = Impulse(0.1, 0);
let o1 = MulAdd(
	SinOsc(TRand(0.3, 5, tr), 0),
	TRand(0, 0.5, tr),
	TRand(0.49, 0.56, tr)
);
let o2 = MulAdd(
	SinOsc(o1, 0),
	TRand(0.3, 0.6, tr),
	TRand(0.3, 0.5, tr)
);
Rhpf(
	BrownNoise(2),
	TRand(0.3, 3, tr),
	o2
) * 0.1
