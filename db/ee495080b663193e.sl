;; CombL ; simplistic karplus-strong synthesis (adc) ; keywords
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
	maxdelaytime: 0.1,
	delaytime: 1 / freq,
	decaytime: 3
);
[
	string,
	LeakDc(
		in: string,
		coef: 0.995
	)
]
