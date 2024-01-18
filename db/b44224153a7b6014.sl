{- Slope ; frequency is the slope of phase (scaled) -}
let freq = 440;
let rate = 2 * pi * freq / SampleRate();
let phase = Phasor(1, rate, 0, 2 * pi, 0);
[
	SinOsc(freq, 0),
	SinOsc(Slope(phase / pi / 2), 0)
] * 0.1
