// https://sccode.org/1-4Qy ; f0 ; 0010
var o = SinOsc.ar(
	SinOsc.ar(0.31, 0),
	SinOsc.ar(SinOsc.ar(0.21, 0), SinOsc.ar(SinOsc.ar(0.11, SinOsc.ar(0.01, 0)), 0) * SinOsc.ar([2, 3], 0) * 400)
) * SinOsc.ar([0.3, 0.21], 0);
LeakDC.ar(o, 0.995)
