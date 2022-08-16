// mouse x controls phase relation ;  / shape = in-phase ; \ shape = out-of-phase ;  O shape = 90 degree phase relation ; jmcc
SinOsc.ar(80, [0, MouseX.kr(0, 2 * pi, 0, 0.2)]) / 3

// harmonic relations ; jmcc
SinOsc.ar([MouseX.kr(60, 300, 0, 30) + 0.04, MouseY.kr(60, 300, 1 , 30)], 0) * 0.1

// harmonic relations ; jmcc
RLPF.ar(
	LFPulse.ar(
		[MouseX.kr(60, 300, 0, 30) + 0.04, MouseY.kr(60, 300, 0, 30)],
		0,
		0.5
	) * 0.1 - 0.05,
	800
)

// panning a mono signal ; x = left channel, y = right channel ; jmcc
Pan2.ar(BrownNoise.ar, MouseX.kr(-1, 1, 0, 0.2), 0.1)

// uncorrelated channels ; jmcc
{ BrownNoise.ar }.dup(2) * 0.1

// uncorrelated channels ; jmcc
{ PinkNoise.ar }.dup(2) * 0.1

// waveform ; jmcc
[
	LFTri.ar(80, 0) * 0.2,
	CombN.ar(
		OnePole.ar(BrownNoise.ar * 0.1, MouseX.kr(0, 1, 0, 0.2)),
		1 / 80,
		1 / 80,
		0.3
	) * SinOsc.ar(80.04, 0.5 * pi).abs
]

// waveform ; jmcc
[
	LFTri.ar(80, 0) * 0.2,
	CombN.ar(
		Resonz.ar(BrownNoise.ar * 0.4, MouseX.kr(20, 12000, 1, 0.2), 0.2),
		1 / 80,
		1 / 80,
		0.3
	) * SinOsc.ar(80, 1).abs
]

// filtered decorrelated noise ; jmcc
CombN.ar(
	Resonz.ar({ BrownNoise.ar }.dup(2) * 0.4, MouseX.kr(20, 12000, 1, 0.2), 0.2),
	1 / 80,
	1 / 80,
	0.3
)

// quad ; eye ; jmcc
var m = MouseX.kr(0.5, 1, 0, 0.2);
var a = LFPulse.ar(200, 0, 0.3) * 0.05;
var b = OnePole.ar(a, m);
var c = OnePole.ar(b, m);
var d = OnePole.ar(c, m);
var e = OnePole.ar(d, m);
[b, c, d, e]
