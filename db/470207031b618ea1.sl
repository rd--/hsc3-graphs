{- CombL ; simplistic karplus-strong synthesis (adc) ; requires=keywords -}
let freq = 440;
let repeatFreq = 0.3;
let exciter = Decay(
	in: Impulse(
		freq: repeatFreq,
		phase: 0
	),
	decayTime: 0.01
) * PinkNoise();
let string = CombL(
	in: exciter,
	maxDelayTime: 0.1,
	delayTime: 1 / freq,
	decayTime: 3
);
[
	string,
	LeakDc(
		in: string,
		coef: 0.995
	)
]
