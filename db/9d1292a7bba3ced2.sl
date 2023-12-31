(* CombL ; simplistic karplus-strong synthesis (adc) ; requires=keywords *)
var freq = 440;
var repeatFreq = 0.3;
var exciter = Decay(
	in: Impulse(
		freq: repeatFreq,
		phase: 0
	),
	decayTime: 0.01
) * PinkNoise();
var string = CombL(
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
