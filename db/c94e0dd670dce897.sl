{-********* Analogue daze (un-commented) ; Jmcc *********-}
let pattern = [55 63 60 63 57 65 62 65];
let f = { :octave :clockRate :pwmrate :fltrate |
	Rlpf(LfPulse(Lag(
		Sequencer(
			((pattern + (12 * octave)).MidiCps), {- sequencer pattern -}
			Impulse(clockRate, 0) {- sequencer trigger -}
		),
		0.05 {- Lag time coefficient -}
	), 0,
		SinOsc(pwmrate, 2.pi.Rand0).MulAdd(0.4, 0.5)) * {- pulse width modulator -}
		0.1, {- pulse amplitude -}
		SinOsc(fltrate, 2.pi.Rand0).MulAdd(1400, 2000), {- cutoff freq LfO -}
		1 / 15)
};
let x = Decay(Impulse(2, 0), 0.15) * LfNoise0(LfNoise1(0.3).MulAdd(6000, 8000)) * [0.07, 0.07];
let g = [f(1, 8, 0.31, 0.2), f(0, 2, 0.13, 0.11)] + x;
let z = 0.4 * (CombN(g, 0.375, 0.375, 5) + g.reverse);
let e = EnvLinen(2, 56, 2, 1, -4); {- one minute trapezoid envelope -}
z * EnvGen(1, 1, 0, 1, 2, e.asArray) {- wrap a one minute envelope around entire sound -}
