// Analogue daze (un-commented) ; Jmcc
var pattern = #[55,63,60,63,57,65,62,65];
var f = { arg octave, clockRate, pwmrate, fltrate;
	RLPF.ar( LFPulse.ar( Lag.kr(
		Sequencer.kr(
			((pattern + (12 * octave)).midicps), // sequencer pattern
			Impulse.kr(clockRate)	// sequencer trigger
		),
		0.05	// Lag time coefficient
	),0,
		SinOsc.kr(pwmrate, 2pi.rand, 0.4, 0.5),  // pulse width modulator
		0.1 // pulse amplitude
	),
		SinOsc.kr(fltrate, 2pi.rand, 1400, 2000), // cutoff freq LFO
		1/15 )
};
var x = Decay.ar(Impulse.ar(2), 0.15, LFNoise0.ar(LFNoise1.kr(0.3,6000,8000),[0.07,0.07]));
var g = [f.value(1,8,0.31,0.2), f.value(0,2,0.13,0.11)] + x;
var z = 0.4 * (CombN.ar(g, 0.375, 0.375, 5) + g.reverse);
var e = Env.linen(2, 56, 2); // one minute trapezoid envelope
z * EnvGen.kr(e,doneAction:2)
