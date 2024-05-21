// https://sonomu.club/@lukiss/112015967098344604
var f = 111 * Scale.phrygian('wcHarm')[(0..7)].midiratio;
var e = {
	LFSaw.ar(GrayNoise.ar() * (1 / 7 ! 8) - 7, 0).lag3(0.001).max(0)
};
var v = SinOsc.ar(1 - e.value / f, 4) + 1 / 2 ** 2;
var p = LFPulse.ar(
	f @ (7 .. 1) / 111,
	0,
	1 - v
) * [1, 2, 4];
var o = VarSaw.ar(
	f + (p * f),
	0,
	1 - e.value ** 2 / 2
) * (p.rotate(2) - e.value @ (7 .. 0) ** 0.125);
var r = FreeVerb.ar(
	BPF.ar(
		o * e.value ** 2,
		1 - e.value * v * 11111 + 111,
		1.1 - v
	),
	1 - v,
	v @ (7 .. 0),
	0.999
) * (1 - (e.value ** 4)) + (e.value * v * o);
Splay.ar(r, (v @ 7 * 111).sin)
