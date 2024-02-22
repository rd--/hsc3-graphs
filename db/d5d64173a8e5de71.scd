// Spa Saw Shower Wash
var c = Signal.sineFill(4096, 1 / (1 .. 128), [0]).normalize.asWavetable.as(LocalBuf);
var w = { | freq |
	LFDNoise3.ar(freq).lincurve(-1, 1, 80, 6880, LFDNoise3.kr(1) * 6)
};
var f = SinOsc.ar(
	{ Rand(3.3, 4.4) } ! 6,
	0
) * 0.01 + 1 * [82, 123, 196, 147, 41, 55];
var o = Splay.ar(
	Osc.ar(
		c,
		f,
		Osc.ar(
			c,
			f * 3,
			0
		) * SinOsc.ar(1 / Rand(33, 45), 0) * pi
	) / 5,
	SinOsc.ar(1 / pi, 0)
);
o = BHiPass4.ar(o, w.(1 / 7), 1) + BPF.ar(o, w.(1 / 5), 1) + MoogFF.ar(o, w.(1 / 3), 2, 0);
4.do {
	o = AllpassC.ar(o, 1, { Rand(1 / 16, 1 / 32) } ! 2, 1)
};
o
