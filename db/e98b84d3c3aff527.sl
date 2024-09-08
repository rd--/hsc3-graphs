{- AllpassL ; Mouse controls decay time -}
let t = Dust([2, 2]);
let z = Decay(t * 0.5, TRand(0.05, 0.15, t)) * PinkNoise();
let decayTime = MouseY(0.5, 1.5, 0, 0.2);
8.timesRepeat {
	let delayTime = 0.1.atRandom(2);
	z := AllpassL(z, delayTime, delayTime, decayTime)
};
z
