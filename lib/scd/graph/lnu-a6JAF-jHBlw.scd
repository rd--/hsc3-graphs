// https://www.youtube.com/watch?v=a6JAF-jHBlw ; lnu
var m = { LFTri.kr({ 0.005.rand }, 0) * 0.0003 + 0.5 };
var v = LFTri.kr(m.value, 0) * 0.001 + 0.6;
var c = { TChoose.kr(CuspN.ar( 120 * m.value.hypot(v.tan) ** v, 1, 1.9, 0), [0, 5.1, -4.7, -12, 7]) };
var f = {
	arg a;
	FM7.ar(
		v * [(c.value + a).midiCps, 0, SinOsc.ar(13 * v, 0, 0.2, (2 * v).exp * v) / 8].dup(6),
		(m.value.dup(6).dup(6))
	).softClip.sum
};
Splay.ar(
	[0, 3.1, 7.05, 10, -9, 17].collect({
		arg n;
		Pan2.ar(f.value(c.value + 52 + n) * (12 * m.value.neg).dbAmp, LFNoise2.kr(500), 1)
	}),
	0.5, 1, 0, true
).transpose.sum

