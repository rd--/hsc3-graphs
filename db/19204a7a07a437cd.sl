(* tutorial 2.5 ; bell patch ; requires=kr *)
let spectrum = [0.5 1 1.19 1.56 2 2.51 2.66 3.01 4.1];
let amplitudes = [0.25 1 0.8 0.5 0.9 0.4 0.3 0.6 0.1];
let numPartials = spectrum.size;
let modFreqs1 = { Rand(1, 5) } ! numPartials;
let modFreqs2 = { Rand(0.1, 3) } ! numPartials;
let decayTimes = (1 .. numPartials).collect { :i |
	Rand(2.5, 2.5 + (5 * (1.0 - (i - 1 / numPartials))))
};
(1 .. numPartials).collect { :i |
	let freq = spectrum[i] + (SinOsc(modFreqs1[i], 0) * 0.005) * 500;
	let amp = 0.1 * Line(
		1,
		0,
		decayTimes[i]
	) * (SinOsc(modFreqs2[i], 0) * 0.1 + 0.9 * amplitudes[i]);
	Pan2(SinOsc(freq, 0), Rand(-1, 1), amp)
}.Mix
