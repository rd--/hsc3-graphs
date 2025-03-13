// https://fredrikolofsson.com/f0blog/sapf-sctweets/ ; 0227
var b = LFPulse.ar(LFPulse.ar(4 / 3, 0, 0.5) * 4, 0, 0.5).lag2(0.01);
var c = 2 / (6 .. 9);
var d = (99 ** b * LFPulse.ar(c, 0, 0.5)).lag(0.1);
Splay.ar(
	SinOsc.ar(d, 0) + (
		SinOsc.ar(d * b / c, b * d) * (1 - c)
	)
) / 4
