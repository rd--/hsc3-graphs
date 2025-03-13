// https://fredrikolofsson.com/f0blog/sapf-sctweets/ 0284
var c = [6, 14, 4];
RHPF.ar(
	Splay.ar(
		SinOsc.ar(
			LFTri.ar(c, 0) % LFTri.ar(c, 0),
			LFTri.ar(c - 1, 0) + 1 ** LFTri.ar(c / 9, 0) * 4
		) * (
			LFTri.ar(1 / c, 0) > 0 * 99
		)
	),
	99,
	0.3
).tanh * 0.6
