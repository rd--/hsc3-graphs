{- Formlet ; parameters randomised on trigger ; stereo -}
let tr = Impulse(LfNoise2([0.15, 0.6]) * 15 + 15, 0.5);
Formlet(
	tr,
	TRand(30, [150, 600], tr),
	TRand(0.01, [0.15, 0.6], tr),
	TRand(0.05, [0.15, 0.6], tr)
) * 0.25
