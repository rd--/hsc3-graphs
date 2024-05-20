// https://www.youtube.com/watch?v=mKbRuL41uR0 ; lnu
var f = 40 * (1, 3 .. 33);
var c = LatoocarfianL.ar(4, 1, 3, 0.5, 0.5, 0.5, 0.5).exprange(0.01, 1).hanWindow * 8;
var t = 2 ** (LatoocarfianL.ar(c, 1, 3, 0.5, 0.5, 0.5, 0.5) * 2 + 1).ceil;
var e = (LFSaw.ar(-1 * t, 1) * 1 + 1 / 2 ** t).lag3(0.005);
var g = ((LFSaw.ar(-1 * e ** t, 1) * f.log2) * LatoocarfianL.ar(t ** t * (f / f.sum), 1, 3, 0.5, 0.5, 0.5, 0.5).tanh.exprange(0.01, 1) * (t ** 2 ) * e).sin.abs;
Splay.ar(
	BPF.ar(
		LFSaw.ar(f + (LFPulse.ar(f * 8, 1, 1 - (e)) / 2 ** (t * 2) * f * t), 0) ** (e ** 2 * (t + t)),
		g * (e ** (t / 8) * 11000) + 40,
		1.2 - e
	),
	t.sin,
	1,
	0,
	true
).tanh / 4
