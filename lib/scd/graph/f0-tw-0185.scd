// https://fredrikolofsson.com/f0blog/sapf-sctweets/ 0185
var c = (1 .. 32);
Splay.ar(
	SinOsc.ar(
		0,
		BPF.ar(
			LFSaw.ar(pi / c, 0) * 8pi * LFSaw.ar(
				c * (LFSaw.ar(2 / c, 1 / c) * 8.16 + 16),
				0
			),
			c * 99,
			LFSaw.ar(3 / c, 0) / 3 + 0.34
		)
	) / 2
)
