var b = [
	43 55 72 70 55 58 41 67
	41 60 55 39 58 55 43 51
].asLocalBuf;
var rate = MouseX(1, 3, 1, 0.2);
var clock = Impulse(rate, 0);
var env = Decay2(clock, 0.002, 2.5);
var index = Stepper(clock, 0, 0, 15, 1, 0);
var freq = BufRd(1, b, index, 1, 1).MidiCps;
var lfreq = Lag2(freq, 0.1) + [0, 0.3];
var ffreq = Lag2(lfreq, 0.1) + [0, 0.3];
var lfo = SinOsc(0.2, [0, 0.5 * pi]) * 0.0024 + 0.0025;
var rvb = { :in |
	var c = CombL(in, 1, 0.66 / rate, 2) * 0.8 + in; (* echo *)
	var z = c;
	5.timesRepeat {
		z := AllpassN(
			z,
			0.05,
			{ Rand(0, 0.05) } ! 2,
			Rand(1.5, 2)
		)
	};
	c + (0.3 * z)
};
var out = LfPulse(lfreq * [1, 3/2, 2], 0, 0.3).Sum;
out := Rlpf(out, ffreq, 0.3) * env;
out := Rlpf(out, ffreq, 0.3) * env;
out := LeakDc(rvb(out * 0.02), 0.995);
1.timesRepeat {
	out := DelayL(out, 0.1, lfo) + out
}; (* flanger *)
OnePole(out, 0.9) * 0.5
