{- AllpassN ; simple reverb ; https://listarc.cal.bham.ac.uk/lists/sc-users-2005/msg05902.html -}
let sinInput = SinOsc(LfNoise2(1).LinLin(-1, 1, 333, 555), 0);
let env = LfNoise2(1).Abs * 0.1;
let noiseInput = Dust(1).Decay(0.2) * PinkNoise() / 2;
let decayTime = 1;
let numDelays = 6;
let maxDelayTime = 0.05;
let output = sinInput * env + noiseInput;
numDelays.timesRepeat {
	output := AllpassN(
		output,
		maxDelayTime,
		{ Rand(0, maxDelayTime) } ! 2,
		decayTime
	)
};
output
