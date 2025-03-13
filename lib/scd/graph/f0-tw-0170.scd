// https://fredrikolofsson.com/f0blog/sapf-sctweets/ 0170
var b = [2, 3];
var c = SinOsc.ar(
	0,
	SinOsc.ar(b, 0) * 400
) * SinOsc.ar(b / 4.1, 0);
c + SinOsc.ar(
	b * 99 * Amplitude.ar(c, 0, 1 / 7),
	0
) + (
	GrayNoise.ar() * CombN.ar(c, 1, b / 3, 1)
) / 2
