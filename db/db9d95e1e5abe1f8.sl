{- 20061030 ; rd -}
let tr = Dust([12 18]);
let f = LfNoise0(TRand(1, 64, tr)) * [9000 12000] + 9500;
let o = [
	f,
	f * TRand(0.750, 0.7505, tr),
	f * TRand(0.975, 1.025, tr)
].Saw.Mix;
(o * TRand(0.0, 0.5, tr)).Clip2(0.75) * 0.15
