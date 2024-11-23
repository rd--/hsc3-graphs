/* Interesting rising sounds */
1:5.collect { :c |
	Pan2(SinOsc(LfSaw((c * 0.2 + 1) / 3, 0) * 500 + 700, 0), LfNoise0(1), 0.05)
}.Mix
