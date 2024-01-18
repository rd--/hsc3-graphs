{- AllpassL ; Mouse controls feedback coefficient -}
let t = Dust([2, 2]);
let z = Decay(t * 0.5, TRand(0.05, 0.15, t)) * PinkNoise();
let feedbackCoefficient = MouseY(0.35, 0.65, 0, 0.2);
8.timesRepeat {
	let delayTime = { 0.1.randomFloat } ! 2;
	let decayTime = delayTime / (feedbackCoefficient.Log / -60.DbAmp.Log.Abs);
	z := AllpassL(z, delayTime, delayTime, decayTime)
};
z
