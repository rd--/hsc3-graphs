SinOsc( {- sine wave -}
	Lag( {- lag the modulator -}
		LfPulse(4, 0, 0.5) * 50 + 400, {- frequency modulator -}
		Line(0, 1, 15) {- modulate lag time -}
	),
0) {- phase -}
* 0.3 {- sine amplitude -}
