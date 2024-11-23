/********** Lfo modulation of Pulse waves and resonant filters ; Jmcc **********/
CombL(
	Rlpf(LfPulse(SinOsc(0.05, 0).MulAdd(80, 160),0, 0.4) * 0.05,
		SinOsc([0.6, 0.7], 0).MulAdd(3600, 4000), 0.2),
	0.3, [0.2, 0.25], 2)
