let tr = DustRange(
	0.005,
	SinOsc(1 / 11, 0).LinLin(-1, 1, 0.005, 0.125)
);
let dur = TRand(
	0.05,
	SinOsc(1 / 13, pi).LinLin(-1, 1, 0.05, 0.125),
	tr
);
let w = TrigAllocator(256, 1, tr, dur);
let shape = MouseX(0.25, 0.75, 0, 0.2);
let skew = MouseY(0.25, 0.75, 0, 0.2);
let env = EnvTrapezoid(
	w,
	dur,
	TRand(shape - 0.1, shape + 0.1, w),
	TRand(skew - 0.1, skew + 0.1, w)
);
let osc = Blip(
	TRand(
		333,
		SinOsc(1 / 17, pi).LinLin(-1, 1, 333, 555),
		w
	),
	TRand(
		1,
		SinOsc(1 / 23, pi).LinLin(-1, 1, 1, 4),
		w
	)
) * env / 2;
osc.Splay
