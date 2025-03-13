// https://fredrikolofsson.com/f0blog/sapf-sctweets/ 0198
var b = (1 .. 5) / 8;
Splay.ar(
	Ringz.ar(
		CombN.ar(
			ClipNoise.ar() * (
				LFSaw.ar(b, 0) > (LFSaw.ar(0.1, 0) + 0.5)
			),
			1,
			b,
			2
		),
		[261, 311, 349, 391, 466],
		1
	)
) / 90
